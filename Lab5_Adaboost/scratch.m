[X0, X1] = make_cloud;
weakmodel = weaklearn(X0, X1);
X0weaktest = weakeval(X0, weakmodel);
X1weaktest = weakeval(X1, weakmodel);
num_incorrect = 0;
for i = 1:500
	if X0weaktest(i) == -1
		num_incorrect = num_incorrect + 1
	end
	if X1weaktest(i) == 1
		num_incorrect = num_incorrect + 1
	end
end
num_incorrect = 326 %out of 1000

 for i = 1:500
if X0boost(i) == -1
y1(end + 1) = X0(2, i)
x1(end + 1) = X0(1, i)
elseif X0boost(i) == 1
y0(end + 1) = X0(2, i);
x0(end + 1) = X0(1, i);
end
if X1boost(i) == -1
y1(end + 1) = X1(2, i);
x1(end + 1) = X1(1, i);
elseif X1boost(i) == 1
y0(end + 1) = X1(2, i);
x0(end + 1) = X1(1, i);
end
end