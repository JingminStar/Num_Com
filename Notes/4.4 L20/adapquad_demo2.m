% this is to demonstrate the adaptive trap.rule to compute integration
% of 1+sin(exp(3x)) on [-1, 1]
% 2015.11.19

disp('This is to demonstrate the adaptive quadrature based on trap. rule')
disp('we also want to see how the adaptive quadrature points are distributed')
pause
f=@(x) 1+sin(exp(3*x));   % integrand
ax=-1; bx=1;               % interval
format 
% case 1
tol_total=0.1;
[int_app1,quad_nodes1]=adapquad2(f, ax, bx, tol_total);
disp('case 1:  tol=0.1, the approximate integral is');
int_app1
disp('the total number of quad nodes is')
nnd1=length(quad_nodes1)
pause

%case 2
tol_total=0.05;
[int_app2,quad_nodes2]=adapquad2(f, ax, bx, tol_total);
disp('case 2:  tol=0.05, the approximate integral is');
int_app2
disp('the total number of quad nodes is')
nnd2=length(quad_nodes2)
pause

% case 3
tol_total=0.01;
[int_app3,quad_nodes3]=adapquad2(f, ax, bx, tol_total);
disp('case 3:  tol=0.01, the approximate integral is');
int_app3
disp('the total number of quad nodes is')
nnd3=length(quad_nodes3)

% plot the nodes distribution
disp('next we will see how the quadrature nodes are distributed')
pause
x=ax:0.01:bx;
y=f(x);
plot(x,y,quad_nodes1,zeros(1,nnd1),'g*')
xlabel('x'); ylabel('f(x)');
pause
hold on
plot(quad_nodes2,zeros(1,nnd2),'bv')
pause
plot(quad_nodes3,zeros(1,nnd3),'ro')


