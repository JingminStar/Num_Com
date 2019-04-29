% Apply =fixed point iteration to g(x)=S x+T, with T=1
% to understand the role of the slope S 
% on convergence and divergence 
%
% 2.2.2019



disp('g(x) = S x + 1')
disp('where the slope of g is S, and the fixed point is 1/(1-S)')
pause

disp('Example 1: S=2, fixed point is -1, x0=-0.8');
S=2; x0= -0.8 ;
g = @(x) S*x+1;
cobweb(g, -4, 16, x0,  7)
disp('the scheme diverges')
pause 

disp('Example 2: S=0.5, fixed point is 2, x0=5');
S=0.5; x0=5;
g = @(x) S*x+1;
cobweb(g, 0, 6, x0, 7)
disp('the scheme converges')
pause 

disp('Example 3: S=-2, fixed point is 1/3, x0=0.33');
S=-2; x0= 0.2;
g = @(x) S*x+1;
cobweb(g, -10, 10, x0, 5)
disp('the scheme diverges')
pause 

disp('Example 4: S=-0.5, fixed point is 2/3, x0=3/4');
S=-0.5; x0=3/4;
xe=1/(1-S);
g = @(x) S*x+1;
cobweb(g, 0, 1, x0, 7)
disp('the scheme converges')
pause 

