function y = myPolyEval( x, xvec, a)
%% to evaluate a polynomial at x
% inputs: x: where the polynomial p(x) is evalute
% xvec(j): the input nodes to interpolate the function
% a: a vector of length d+1, that contains% the coefficients of p(x), with the constant 
% term p(0) being the last
% output: y = p(x)
%%%%%%%%%%%%%%%%%%
n = length(a);
y = a(n);
for j = n-1:-1:1
  y = y*(x-xvec(j))+a(j);  
end
