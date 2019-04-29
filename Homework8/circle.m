h = 0.02;
r = 1;
xprime = @(t,y) -y;
yprime = @(t,x) x;
num_int = 120/h;
tvec = 0 + (0:num_int)*h;
tvec = tvec';
yvec = zeros(num_int+1,1);
xvec = ones(num_int+1,1);
xvec(1) = r;
for i = 1:num_int
   yvec(i+1) = yvec(i) + h * yprime(tvec(i),xvec(i));
   xvec(i+1) = xvec(i) + h * xprime(tvec(i),yvec(i));
end
figure(1)
plot(xvec, yvec,'k-');
hold on
plot(xvec(1),yvec(1),'r*')
plot(xvec(num_int+1),yvec(num_int+1),'b*')
legend ("FE")


yvec2 = zeros(num_int+1,1);
xvec2 = ones(num_int+1,1);
xvec2(1) = r;
for i = 1:num_int
   x1 = xvec2(i); y1 = yvec2(i);
   xvec2(i+1) = (x1 - h* y1)/(1+h^2);
   yvec2(i+1) = y1 + h * xvec2(i+1);
end
figure(2)
plot(xvec2, yvec2,'b-');
hold on
plot(xvec2(1),yvec2(1),'r*')
hold on
plot(xvec2(num_int+1),yvec2(num_int+1),'b*')
legend ("BE")

yvec3 = zeros(num_int+1,1);
xvec3 = ones(num_int+1,1);
xvec3(1) = r;
for i = 1:num_int
   x1 = xvec3(i); y1 = yvec3(i);
   xvec3(i+1) = ((1-h^2/4)*x1-h*y1)/(1+h^2/4);
   yvec3(i+1) = y1 + h/2 * (x1 +xvec3(i+1));
end
figure(3)
plot(xvec3, yvec3,'g-');
hold on
plot(xvec3(1),yvec3(1),'r*')
hold on
plot(xvec3(num_int+1),yvec3(num_int+1),'b*')
legend ("Trapezoidal")