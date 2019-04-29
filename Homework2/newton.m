    %% This progeam applies newton's method to function f1
%% And make a table to see the value in each iteration
%% %%%%%


f1=@(x)94*(cos(x))^3-24*cos(x)+177*(sin(x))^2- ...
108*(sin(x))^4-72*(cos(x))^3*(sin(x))^2-65;
fd1=@(x) -282*(cos(x))^2*sin(x)+24*sin(x)+354*sin(x)*cos(x)- ...
432*(sin(x))^3*cos(x)+216*(cos(x))^2*(sin(x))^3-144*(cos(x))^4*sin(x);

a = newtons(f1,fd1,1,1000,3,0.5*10^(-6));

function x = newtons(f,fd, x, imax, xmax, tol)
fprintf(1,[' i   ', '      x_i\n']);
if f(x) == 0 % If the input is already the root
     fprintf(1,'%2.1i   %1.10f\n',[0, x]);
else
    i = 0; % index of iteration
    err = 10*tol; % Set the initial value of error
    while  err > tol 
        % if the difference between two iteration is less that tol, stop
        z = f(x)/fd(x); % original/derivative
        x = x -z; % The value for the new iteration
        err = abs(z); %the difference between two iteration
        i = i+1; 
        if(i > imax)
            % If the number of iteration is sufficiently large, stop
            break
        end
        if(x > xmax) % If the answer go too far from what we expect, stop
            break
        end
      fprintf(1,' %2.1i   %1.10f\n',[i, x]); 
    end
end
end