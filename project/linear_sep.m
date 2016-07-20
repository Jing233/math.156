%this script is the property of Rishir Dua: https://github.com/rishirdua/linear-separability-matlab
% it has been tweaked to perform for this lab. It runs independently of runMyLab.
%HOW TO USE: put data_conversion.m, adult.test.dat, adult.data.dat in the same directory as this.
%			-- afterwards, just run linear_sep
%	note: the algorithm does not converge for our dataset, increasing the number of maxiter will prolong the nonconvergence


%clc; clear; close all;
data_conversion;
Ytrain = over50k;
Xtrain = data;
%set max iteration
maxiter = 10000;

%load data
%[Ytrain, Xtrain] = libsvmread('sample.txt'); %libsvm format
mtrain = size(Xtrain,1);
n = size(Xtrain,2);


% learn perceptron
Xtrain_perceptron = [ones(mtrain,1) Xtrain];
alpha = 0.1;
%initialize
theta_perceptron = zeros(n+1,1);
trainerror_mag = 1000000;
iteration = 0;

%loop
while (trainerror_mag>0)
	fprintf('iteration is %i, trainerror is %i\n', iteration, trainerror_mag);
	iteration = iteration+1;
	if (iteration == maxiter)
		break;
	end;
	for i = 1 : mtrain
		Ypredict_temp = sign(theta_perceptron'*Xtrain_perceptron(i,:)');
		theta_perceptron = theta_perceptron + alpha*(Ytrain(i)-Ypredict_temp)*Xtrain_perceptron(i,:)';
	end
	Ytrainpredict_perceptron = sign(theta_perceptron'*Xtrain_perceptron')';
	trainerror_mag = (Ytrainpredict_perceptron - Ytrain)'*(Ytrainpredict_perceptron - Ytrain);
end

if (trainerror_mag==0)
	fprintf('Data is Linearly seperable\n'); 
	fprintf('Parameters are:\n'); 
	disp(theta_perceptron)
else
	fprintf('Data is not linearly seperable');
end;