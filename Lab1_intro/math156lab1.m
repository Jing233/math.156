%Theodore Nguyen, 704-156-701, Math 156 Lab 1 Spring 2016. Script.
%load data. Have data.mat in the working directory.
data = load('data.mat');
X = data.X;
%initialize counter sum
s = 0;

%use first looping method to compute sum, and time it
fprintf('We first compute the sum using the loop.\n');
tic
for i = 1:size(X,2)
    s = s + norm(X(:,i));
end
toc
fprintf('The sum computed using the looping method is %e.\n\n', s);

%use sum function to do the same thing
s = 0;
fprintf('We now compute the sum using the sum function with MATLAB functions, step by step.\n');
tic
%compute the power of each entry of the matrix (thus computing the power of
%each element of each vector in each column)
elementwiseSquare = X.^2;      
%compute the sum of those squares for each column
sumofsquares = sum(elementwiseSquare, 1);
%compute the square root of those sums to get the sum of squares for each
%column - aka the L2 norm for each column vector
L2norms = sqrt(sumofsquares);
%compute the sum of the L2 norms
s = sum(L2norms);
toc
fprintf('The sum computed using MATLAB functions is %e.\n\n', s);

%try the sum function all in one step
s = 0;
fprintf('We now compute the sum with the same functions all in one step.\n');
tic
s = sum(sqrt(sum(X.^2,1)));
toc
fprintf('The sum computed with MATLAB functions in one step is %e.\n', s);