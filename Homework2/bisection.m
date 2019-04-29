%% This program is to use the bisection method to solve for the root 
%% of function cos(x)-2sin(x) and produce a table to show the value
%% of each iteration
%%%%%%%%%

f=@(x) cos(x)-2*sin(x);
T = bisection1(f,0,1,0.5*10^(-6));

function c = bisection1(f,a,b,tol)
fprintf(1,[' i   ', '      c\n']);
if f(a) == 0 %If a is already 0, then stop
       c = a;
     fprintf(1,'%2.1i   %1.10f\n',[0, c]);
elseif f(b) == 0 %If b is already 0, then stop
        c = b;
      fprintf(1,'%2.1i   %1.10f\n',[0, c]);
elseif f(a)* f(b) > 0 
    %If they are at the same side of x axis, then not applied 
    error('The initial condition is not satisfied');
else
    i = 0; % index of current iteration
    while  (b-a)/2 > tol 
%stopping criteria: If the distance between a and b greater than 2tol, stop
           i = i+1; % to the next iteration
           c = (a+b)/2; 
           fc = f(c); % Store it to accerlerate the program
      if fc == 0
         fprintf(1,'%2.1i   %1.10f\n',[i, c]);
         % If c is answer, then add it to the table
          break          % and break the loop
      end
      if fc * f(a) <0
        b=c;
      else 
        a=c;
      end
       fprintf(1,'%2.1i   %1.10f\n',[i, c]);
       % Add c to the table and go to next iteration
    end
end
end