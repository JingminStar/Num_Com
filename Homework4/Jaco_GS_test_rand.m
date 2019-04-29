%% Solution of x in Ax=b using Jacobi Method and Gauss -Seidel Method
%%
clear all; clc;
tol=1e-15;
format long;


% Initailize A b and intial guess x
r = 100;
randn('seed',20190227);
A = randn(r);
b = randn(r,1);
x = randn(r,1);

% To make the matrix diagonally dominant, I simply made the absolute value 
% of diagonal matrix to be the sum of all absolute value in the random
% matrix
for i =1:r
   for j = 1:r
       A(i,i) = abs(A(i,i))+abs(A(i,j));
   end
          q = randn();
       if q >=0 
           q = 1; 
       else
           q=-1; 
       end
       A(i,i) = q * (A(i,i)+abs(randn()));
end

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