% function r=romberg(f,a,b,n)
%
% to compute Romberg Tabuleau with n level
% based on Trap rule
%
% Inputs: the integrand function, f; interval, [a,b]; level, n
% Output: Romberg tabuleau with n rows
%
% 2015.11.19: based on Sauer's program 5.1

function r=romberg(f,a,b,n)
h=(b-a)./(2.^(0:n-1));
r(1,1)=(b-a)*(f(a)+f(b))/2;
for j=2:n
sum=0;
for i=1:2^(j-2)
sum=sum+f(a+(2*i-1)*h(j));
end
r(j,1)=r(j-1,1)/2+h(j)*sum;
for k=2:j
    r(j,k)=4^(k-1)*r(j,k-1)-r(j-1,k-1);
    r(j,k)=r(j,k)/(4^(k-1)-1);
end
end

