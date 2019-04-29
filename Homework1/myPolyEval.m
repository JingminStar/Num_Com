function y = myPolyEval(x, a, d)
% to evaluate a polynomial at x
%% inputs: x: where the polynomial p(x) is evalutedix
% d: the degree of p(x)
% a: a vector of length d+1, that contains% the coefficients of p(x), with the constant 
% term p(0) being the last
% output: y= p(x)
%%%%%%%%%%%%%%%%%%
if ((length(a)-d)==1)
y = a(1);
for j =2:d+1
y = y*x+a(j);                                                           
end
else
disp('error: inconsistency in polynomial degree!')
end