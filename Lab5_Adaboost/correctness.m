function [numWrong] = correctness(X0, X1, num)
	[params, weights] = boostlearn(X0, X1, num);
	X0b = boosteval(X0, params, weights);
	X1b = boosteval(X1, params, weights);
	numWrong = 0;
	for i = 1:500
		if X0b(i) == -1
			numWrong = numWrong + 1;
		end
		if X1b(i) == 1
			numWrong = numWrong + 1;
	end
end