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
Ham = Phi * transpose(Phi);
[HamRow, HamCol] = size(Ham);
I = eye(PhiRow);
Imod = I / (mu^2);
term1sum = Ham + Imod;
term1 = inverse(term1sum);
term2 = (transpose(Phi) * t);


w = term1 * term2;


end


%{
0.00000
   0.00000
   0.61612
   0.00000
   0.49419
   0.00000
   0.00000
   0.00000
   0.00000
   0.00000
   this is HF1
   %}

   
   
 %GF10000 and GF1000 are blank
%{
GF =

   0
   0
   0
   0
   0
   0
   0
   0
   0
   0

GF =

  1.0040e-058
  1.0040e-058
  1.0040e-058
  1.0040e-058
  1.0039e-058
  1.0040e-058
  1.0040e-058
  1.0040e-058
  1.0040e-058
  1.0040e-058

GF =

   4.7016e-148
   4.7355e-148
   4.6961e-148
   4.7028e-148
   4.6895e-148
   4.7225e-148
   4.7299e-148
   4.7205e-148
   4.7123e-148
   4.7272e-148

GF =

  -3.4765e-017
  -3.8740e-017
  -3.4160e-017
  -3.4905e-017
  -3.3440e-017
  -3.7174e-017
  -3.8053e-017
  -3.6935e-017
  -3.5974e-017
  -3.7731e-017

GF =

   0.0097937
   0.0102612
   0.0097126
   0.0098121
   0.0096125
   0.0100899
   0.0101880
   0.0100623
   0.0099475
   0.0101527

GF =

  2.1213e-001
  5.1303e-004
  2.9229e-001
  1.9209e-001
  3.3744e-001
  1.1601e-002
  2.2481e-003
  1.7244e-002
  6.7218e-002
  4.2362e-003

%} 
 

%{
sum1 = 0;
sum2 = 0;
sum3 = 0;
for n = 1:10
	for j = 1:10
		sum1 = sum1 + Hw(j)*HPhi(j, n) - y(n);
	end
	sum1 = sum1^2;
	sum1 = (0.5)*sum1;
	sum2 = sum2 + sum1;
	sum1 = 0;
end

secondsum = 0;
for j = 1:10
	secondsum = secondsum + Hw(j)^2;
end
secondsum = secondsum / (2*Mu^2);

sum3 = sum2 + secondsum; 
%} 



