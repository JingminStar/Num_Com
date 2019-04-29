%% Function: Compare the relationship between relationship of computed error and condition number of matrix A
del_vec =[10^(-2), 10^(-6), 10^(-8)];
relationship_error(del_vec);

function  relationship_error(del)
x =[7;3];
  for delta = del 
    %Create A
    A=[1,2;1+delta,2];
    
    %Compute b
    b=A*x;
    
    %Give the computed root
    xc = A\b;
    
    %Compute the relative error
    err = norm(x-xc,inf)/norm(x,inf);
    
    %Compute the condition number
    condition = cond(A,inf);
    fprintf('delta = %10.8f  solution = %15.10f %15.10f relative error = %e cond(A) = %5.4e\n', delta,xc,err,condition);
  end
end