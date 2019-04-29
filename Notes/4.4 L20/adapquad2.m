% function adapquad2.m
% 
% Adaptive quadrature: based on trap. rule
%
% Inputs: the integrand function, f; interval, [a0,b0]; error tolerance, tol_total
% Output: approximate integral, int; adaptive quadrature nodes, quad_nodes
%
% What is new: adaptive quadrature nodes are output
%
%  2015.11.19, based on Sauer's Program 5.2


function [int, quad_nodes]=adapquad2(f,a0,b0,tol_total)
int=0;
n=1; 
a(1)=a0; b(1)=b0; tol(1)=tol_total;
app(1)=trap(f,a,b);
quad_nodes(1:2)=[a(1), b(1)];  m=2; % record the first two quad nodes, initiate the count m
while n>0   % n is the current position at end of the list
    c=(a(n)+b(n))/2; oldapp=app(n);  
   
    app(n)=trap(f,a(n),c); app(n+1)=trap(f,c,b(n));
    tmp=app(n)+app(n+1);
    if abs(oldapp-tmp)<3*tol(n)  % success  (check error indicator) 
        int=int+tmp;
        n=n-1;
    else                         % further refined
        b(n+1)=b(n); b(n)=c; a(n+1)=c;
        tol(n)=tol(n)/2; tol(n+1)=tol(n);
        n=n+1;
    end
    m=m+1; quad_nodes(m)=c; % ## record new quad nodes
end
quad_nodes=sort(quad_nodes); % ## sorting
end

% trap. rule
function s=trap(f,a,b)
s=(f(a)+f(b))*(b-a)/2;
end