%overview:
% (1) get params - We need basis parameters from the hat_basis.m or gauss_basis.m
% (2) get func - we use the previously obtained params to get a function 
% (3) get design matrix - we use the func to compute the design matirx
% (4) evaluate least squares - we use the design matrix to get optimal w's

%function [params] = basis(a, b, num)
%creates parameters; a and b are starting/ending interval, num is # of elements

%contains:		x = 10x1 float 		y = 10x1 float
load('simple.mat');
%contains		xt = 1x20 float		yt = 1x20 float
load('test.mat');

%we want to vary Mu
Mu = 10^5;
num = 10;
a = 0;
b = 2*pi;

%WE WANT TO VARY ""num"" in the basis argument - ends up being a matrix dim
Gparams = gauss_basis(a, b, num);
Hparams = hat_basis(a, b, num);


Gw = lsefit(x, y, Gparams, @func_gauss, Mu);
Hw = lsefit(x, y, Hparams, @func_hat, Mu);	





while(Mu >= 1)
	Gparams = gauss_basis(a, b, num);
	Hparams = hat_basis(a, b, num);
	Gw = lsefit(x, y, Gparams, @func_gauss, Mu);
	Hw = lsefit(x, y, Hparams, @func_hat, Mu);
	GF = func_gauss(x, Gw);
	HF = func_hat(x, Hw);
	figure 
	plot(x, GF);
	title(['Gaussian model with Mu =', num2str(Mu)]);
	figure
	plot(x, HF);
	title(['Hat model with Mu =', num2str(Mu)]);
	
	Mu = Mu / 10;
	
end



Mulist = [];
SquaredErrorList = [];
for Mu = 1:100
	%fit
	Gparams = gauss_basis(a, b, num);
	Gw = lsefit(x, y, Gparams, @func_gauss, Mu);
	
	%test
	GF = func_gauss(xt', Gw);
	
	%geterror
	absoluteError = GF - yt';
	squaredabserror = absoluteError.^2;
	sumOfsquares = sum(squaredabserror);
	
	Mulist(end + 1) = Mu;
	SquaredErrorList(end + 1) = sumOfsquares;
	
end

figure
plot(Mulist, SquaredErrorList);
title(['Gaussian; y = total squared error, x = Mu']);
%minimum error at Mu = 60



Mu = 60;
numlist = [];
SquaredErrorList2 = [];
for num = 2:100
	%fit
	Gparams = gauss_basis(a, b, num);
	Gw = lsefit(x, y, Gparams, @func_gauss, Mu);
	%test
	GF = func_gauss(xt', Gw);
	%geterror
	absoluteError = GF - yt';
	squaredabserror = absoluteError.^2;
	sumOfsquares = sum(squaredabserror);
	
	numlist(end + 1) = num;
	SquaredErrorList2(end + 1) = sumOfsquares;
	
end
	
figure
plot(numlist, SquaredErrorList2);
title(['Gaussian; y = total squared error, x = num of basis']);

