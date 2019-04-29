clear all; clc;
format long;


% Initailize the data points of x,y
r = [2,3,4];
for ra =r
randn('seed',20190316);
x = linspace(0,pi/2,ra+1);
y = sin(x);

z =  pi/2*randn(3,1);
b = sin(z);

a = myPolyCoef(x,y);
fprintf('r = %d\n', ra);
for k = 1:length(z)
result = myPolyEval(z(k),x, a);
upperbound =1/factorial(ra+1);
for h = 1:length(x)
    upperbound = abs(upperbound *(z(k) - x(h)));
end
fprintf('When z = % 5.4f, p(z) = % 5.3f, f(z) = % 5.3f, error = %5.4e ub = %5.4e\n',z(k), result,b(k), abs(result-b(k)),upperbound);
end
end