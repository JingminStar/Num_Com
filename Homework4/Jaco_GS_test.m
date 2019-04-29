%% Solution of x in Ax=b using Jacobi Method and Gauss -Seidel Method with the Professor's example

clear all;clc;

% Initailize A b and intial guess x
A=[3 1 -1;2 4 1;-1 2 5];
b=[4 1 1]';
x=[0 0 0]';
tol=1e-15;
format long;

[itr_vec, error1] = Jacobi(A,b,x,tol,100);
[itr_vec1, error2] = GaussSeidel(A,b,x,tol,100);
semilogy(itr_vec, error1,'b-');
hold on
semilogy(itr_vec1, error2,'r-');
xlabel("# of iteration");
ylabel("Relative error");
legend("Jacobi", "Gauss-Seidel");
t0 = tic;
t1 = toc(t0);
fprintf('\n Total running time of my code is %15.14f\n', t1);