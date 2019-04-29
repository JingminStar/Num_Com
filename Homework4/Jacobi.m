%% Algorithm: Jacobi Method
%Input: A,b,x0,tol>0,imax>0
%where A is a matrix, b is a vector to solve *Ax=b*, 
%x0 is the initial guess,
function [itr_vec, error1] = Jacobi(A,b,x,tol,imax)
fprintf ('\n Run Jacobi Method:\n');
itr=0;
error1 = [];itr_vec=[];
error=Inf;
n=size(x,1);
x1=A\b;
while error>tol %Stopping criterion: the relative error
    xold=x;
    
    for i=1:n
        delta = A(i,:) *xold - A(i,i)*xold(i); 
        x(i)=(b(i)-delta)/A(i,i);
    end
    itr=itr+1;
    error= norm(x-x1)/norm(x);
    error1 = [error1;error];
    itr_vec = [itr_vec;itr];  
     if itr>imax 
       break 
     end
end

 fprintf(' Total iterarion = %d \n Final answer=',itr);
    for i = 1:n
      fprintf('%15.14f ',x(i));
    end
    fprintf('error = %15.14f\n', error);