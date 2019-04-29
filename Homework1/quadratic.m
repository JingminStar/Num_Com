format long
[a1,a2] = quadra(1,1.234*10^5,4.567*10^3);

a11 = -1.234 *10^5;
a22 = 0;

error1 = a11 - a1;
error2 = a22 - a2;

data1 = [a1; a11; error1; a2; a22; error2];
function [x1,x2] = quadra(a,b,c)
x1 = (-b - sqrt(b^2 - 4*a*c))/(2*a);
x2 = (-b + sqrt(b^2 - 4*a*c))/(2*a);
end