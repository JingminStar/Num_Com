%% Algorithm: Gauss Seidel Method
%%
function [itr_vec1, error2] = GaussSeidel(A,b,x,tol,imax)
fprintf ('\n Run Gauss-Seidel Method:\n');
error=Inf; 
itr=0;itr_vec1=[];
error2 = [];
n=size(x,1);
x1=A\b;
while error>tol %Stopping criterion: the relative error  
   for i=1:n
       delta = A(i,:) *x - A(i,i)*x(i);
       x(i)=(b(i)-delta)/A(i,i);
    end
    
    itr=itr+1;
    error= norm(x-x1)/norm(x);
    error2 = [error2;error];
    itr_vec1 = [itr_vec1;itr];
    
    if itr>imax 
       break; 
    end
end

 fprintf(' Total iterarion = %d \n Final answer=',itr);
    for i = 1:n
      fprintf('%15.14f ',x(i));
    end
    fprintf('error = %15.14f\n', error);