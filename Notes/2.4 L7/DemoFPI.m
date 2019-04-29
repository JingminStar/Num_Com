% This is to solve x^3+x-1=0 by converting it to a fixed point problem
% x=g(x) using fixed point iterations. Here g=
% g1(x)= 1-x^3;
% g2(x)= (1-x)^(1/3);
% g3(x)= (1+2*x^3)/(1+3*x^2)
%
% 2.2.2019

g1 = @(x) 1-x.^3;
g2 = @(x) (1-x).^(1/3);
g3 = @(x) (1+2*x.^3)./(1+3*x.^2);

% initial
x0=0.5; 

% x=g1(x)
disp('g1(x)=1-x^3, x0=0.5')
disp('iterate xj from fixed point iterations')
pause
FPI(g1,x0,12)
pause
disp('to show the cobweb diagram')
pause
cobweb(g1, 0, 1, 0.5, 10)


% x=g2(x)
disp('g2(x)=(1-x)^(1/3), x0=0.5')
disp('iterate xj from fixed point iterations')
pause
FPI(g2,x0,25)
pause
disp('to show the cobweb diagram')
pause
cobweb(g2, 0, 1, 0.5, 10)

% x=g3(x)
disp('g3(x)=(1+2*x^3)/(1+3*x^2), x0=0.5')
disp('iterate xj from fixed point iterations')
pause
FPI(g3,x0,7)
pause
disp('to show the cobweb diagram')
pause
cobweb(g3, 0, 1, 0.5, 4)
% 
