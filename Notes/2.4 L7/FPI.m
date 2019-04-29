function FPI(g,x0, N)
% fixed point iteration 
% update: x_{n+1}=g(x_n)
% x0: initial
% N:  is the number of iterates

fprintf(1,['  j   ', '      x_j\n']);
fprintf(1,'%2.1i   %1.10f\n',[0, x0]);
pause
for j=1:N-1
    x0=g(x0);
    fprintf(1,'%2.0i   %1.10f\n',[j, x0]);
    pause
end