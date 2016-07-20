%% SOFT Support Vector Machine
% Learns an approximately separating hyperplane for the provided data.
% In the following, N = number of data samples, D = dimensionality of data 
% Inputs: 
% X - Matrix with observations in each row.	This is an N x D matrix
% t - Vector of length equal to the number of columns of X, with either a 1 or -1 
%     indicating the class label. This is a 1 x N array/vector/matrix
% gamma - Slack penalty parameter. Higher implies greater violation penalty. We used
%	  gamma = 0.005 by default here
% Outputs: 									
% w - Normal vector for the output hyperplane (plane equation is <w,x> + b = 0)
% b - Constant offset for the output hyperplane.

function [w, b] = softsvm(X, t, gamma)
	N = size(X, 1);
	D = size(X, 2);
	%make H
	H = eye(N+D+1);
	H(1,1) = 0;
	H(N+D+1, N+D+1) = 0;
	%define f
	ft = [];
	for i = 1:N+D+1
		ft(end + 1) = gamma;
	end
	ft(N+D+1) = 0;
	ft(N+D) = 0;
	f = ft';
	%make A.
	In = eye(N) * -1;
	T = diag(t);
	TX = -1*T*X;
	negt = -1 * t;
	A = [ In TX negt ];
	%define b
	B = [];
	for i = 1:N
		B(i) = -1;
	end
	%define lb
	lbt = [0 -inf -inf];
	lb = lbt';

	xi_w_b = quadprog(H, f, A, B, [], [], lb);

	w = [];
	for i = 1:D
		w(end + 1) = xi_w_b(N+i);
	end

	b = xi_w_b(N+D+1);

end