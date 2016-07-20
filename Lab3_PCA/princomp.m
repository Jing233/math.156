% PRINcipal COMPonent calculator
%   Calculates the principal components of a collection of points.
% Input:
%   X - D-by-N data matrix of N points in D dimensions.
% Output:
%   PCs - A matrix containing the principal components of the data.

function [PCs] = princomp(X)
	[D, N] = size(X);
	mn = mean(X, 2);
	Xmod = X - repmat(mn, 1, N);
	Y = Xmod' / sqrt(N - 1);
	[u, S, PCs] = svd(Y);
	
end