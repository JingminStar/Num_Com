clear all; clc;
format long;


% Initailize the data points of x,y
r = [2,3,4];
for ra =r
randn('seed',20190316);
coef = ra*randn(ra+1,1);
x =  randn(ra+1,1);
y = zeros(ra+1,1);
for i = 1:ra+1
y(i) = coef(ra+1);
for j = ra:-1:1
  y(i) = y(i)*x(i)+coef(j);  
end
end

z = randn(3,1);
b = zeros(3,1);
for i = 1:length(z)
b(i) = coef(ra+1);
for j = ra:-1:1
  b(i) = b(i)*z(i)+coef(j);  
end
end
a = myPolyCoef(x,y);
fprintf('r = %d\n', ra);
for k = 1:length(z)
result = myPolyEval(z(k),x, a);
fprintf('When z = % 5.4f, p(z) = % 7.3f, f(z) = % 7.3f, error = %5.4e\n',z(k), result,b(k), abs(result-b(k)));
end
end