% Least-Squared Error FIT
%  Find the linear combination of basis functions which best model the data.
% Inputs:
%  x - Vector with observation locations in 1D.
%  t - Vector with observations in 1D.
%  params - Parameters for the basis functions to be used in func, e.g. as
%    produced by gauss_basis.
%  func - Function handle which evaluates a basis function with parameters
%    given by the columns of params and at the specified locations. For
%    example, the first basis function at x = 2 is func(2, params(:,1)).
%  mu - Scalar representing the standard deviation of the prior Gaussian on
%    the model parameters.
% Outputs:
%  w - Coefficients used to generate a linear combination of the basis 
%    functions which is the maximum likelihood learned model.

function [w] = lsefit(x, t, params, phi, mu)

% step 1: construct the design matrix Phi.
% to evaluate the j-th basis function on data x, use
%    phi( x, params(:,j) )

Phi = [];
[paramsRow, paramsCol] = size(params);
for i = 1:paramsCol
	Phi = [Phi phi(x, params(:,i))];
end
%currently assuming Phi is a square matrix from what i picked

[PhiRow, PhiCol] = size(Phi);


% step 2: having constructed Phi, you should now compute the coefficients w
Ham = transpose(Phi) * Phi;
[HamRow, HamCol] = size(Ham);
I = eye(PhiCol);
Imod = I / (mu^2);
term1sum = Ham + Imod;
term1 = inverse(term1sum);
term2 = (transpose(Phi) * t);


w = term1 * term2;


end
