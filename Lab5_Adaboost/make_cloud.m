%% MAKE a CLOUD of points
%%  Samples 1000 observations in 2D from two classes.
%% Inputs 
%%  None
%% Outputs
%%  X0 - 500 observations from the first class (in columns).
%%  X1 - 500 observations from the second class (in columns).

function [X0,X1] = make_cloud()
    N = 500;
    X0 = 7*rand(2,N);
    X1 = 7*rand(2,N);

    X0 = (0.5).*[X0(2,:);X0(2,:)].*[sin(X0(1,:)); cos(X0(1,:))];
    X1 = (0.5).*(6 + [X1(2,:);X1(2,:)]).*[sin(X1(1,:)); cos(X1(1,:))];
end