%% An example of applying Richardson Extrapolation 
% To approximate the second derivative of sin(x)+x*exp(-x)
% with F2 knwon as (f(x+h)-2*f(x)+f(x-h))/h^2 to get F4

f = @(x) sin(x)+x*exp(-x);
ffirst = @(x) cos(x)+ exp(-x)*(1-x);
fsecond = @(x) x*exp(-x) - sin(x) - 2*exp(-x);
F2fun = @(x,h) (f(x+h)-2*f(x)+f(x-h))/h^2;
F4fun = @(x,h) (2^2*F2fun(x,h/2)-F2fun(x,h))/(2^2-1);
%F4fun = @(x,h) (-f(x-h)+16*f(x - h/2)-30*f(x)+16*f(x+h/2)-f(x+h))/(3*h^2);
e2fun = @(h) abs(F2fun(pi/3,h) - fsecond(pi/3));    
e4fun = @(h) abs(F4fun(pi/3,h) - fsecond(pi/3));
hvec = 0.1*0.5 .^(1:6);
hvec = hvec';
F2 = zeros(6,1);
e2 = zeros(6,1);
redfac2 = zeros(6,1);
F4 = zeros(6,1);
e4 = zeros(6,1);
redfac4   = zeros(6,1);
for i = 1:6
    h = hvec(i);
   %fprintf("h%d = %5.4f; F2(h%d) = %5.4f; e2(h%d) = %5.4e\n", i,h,i,F2(pi/3,h),i,e2(h)); 
   F2(i) = F2fun(pi/3,h);
   e2(i) = e2fun(h);
   F4(i) = F4fun(pi/3,h);
   e4(i) = e4fun(h);
   if( i ~= 1)
       redfac2(i) = e2(i-1)/e2(i);
       redfac4(i) = e4(i-1)/e4(i);
   end
end
format
T = table(hvec, F2, e2, redfac2, F4, e4, redfac4)
loglog(hvec,e2,'b-');
hold on
loglog(hvec, e4,'r-');
xlabel("h");
ylabel("Error");
legend("Second Order", "Fourth Order");