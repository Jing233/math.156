%% adaBOOST model EVALuator
%%  Uses a trained AdaBoost algorithm to classify data.
%% Inputs 
%%  X - Matrix with observations (in columns) to classify.
%%  params - Output of boostlearn.m (weak learner parameters).
%%  weights - Output of boostlearn.m (weak learner mixing coefficients).
%% Outputs
%%  C - A matrix with predicted class labels (-1 or 1) for the input
%%    observations in X.

function [C] = boosteval(X, params, weights)
	C = [];
	for i = 1:size(X, 2)
		Y = [];
		for k = 1:size(weights, 2)
			Y = [Y, weakeval(X(:,i), params(:,k))];
		end
		sign = 0;
		for j = 1:size(Y, 2)
			sign = sign + weights(j)*Y(j);
		end
		if sign < 0 
			C(end + 1) = -1;
		elseif sign > 0
			C(end + 1) = 1;
	end
end