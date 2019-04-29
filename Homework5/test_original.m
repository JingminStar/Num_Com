clear all; clc;
format long;


% Initailize the data points of x,y
r = [2,3,4];
for ra =r
randn('seed',20190316);
x = randn(ra+1,1);
y = randn(ra+1,1);
a = myPolyCoef(x,y);
fprintf('r = %d\n', ra);
result1 =[];
for k = 1:length(x)
result = myPolyEval( x(k), x, a);
fprintf('When x = % 5.4f, p(x) = % 5.4f, f(x) = % 5.4f, error = %5.4e\n',x(k), result,y(k), abs(result-y(k)));
end
end

