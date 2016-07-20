%% adaBOOST model LEARNer
%%  Uses the AdaBoost algorithm to train a classifier on data.
%% Inputs 
%%  X0 - Observations from the first data class.
%%  X1 - Observations from the second data class.
%%  T - The number of weak learners to include in the ensemble.
%% Outputs
%%  params - A matrix containing the parameters for the T weak learners.
%%  weights - A vector of weights used to combine the results of the
%%    T weak learners.

function [params, weights] = boostlearn(X0, X1, T)
	
	x0dims = size(X0);
	x1dims = size(X1);
	X = [X0, X1];
	numberOfObs = size(X, 2);
	W0 = (ones(x0dims(2))/numberOfObs)(:,1);
	W1 = (ones(x1dims(2))/numberOfObs)(:,1);
	params = [];
	weights = [];
	%weights = (ones(numberOfObs) / numberOfObs) (:,1);
	for t = 1:T
		classifier = weaklearn(X0, X1, W0, W1);
		params = [params, classifier];
		x0_result = weakeval(X0, classifier);
		x1_result = weakeval(X1, classifier);

		epsilon = 0;
		for i = 1:x0dims(2)
			if x0_result(i) == -1
				epsilon = epsilon + W0(i);
			end
		end
		for j = 1:x1dims(2)
			if x1_result(j) == 1
				epsilon = epsilon + W1(j);
			end
		end

		alpha = 0.5 * log((1 - epsilon)/epsilon);
		weights(end + 1) = alpha;

		total = 0;
		for i = 1:x0dims(2)
			W0(i) = W0(i) * e^(-x0_result(i)*1*alpha);
			total = total + W0(i);
		end
		for j = 1:x1dims(2)
			W1(j) = W1(j) * e^(-x1_result(j)*-1*alpha);
			total = total + W1(j);
		end

		W0 = W0/total;
		W1 = W1/total;
		
	end

end