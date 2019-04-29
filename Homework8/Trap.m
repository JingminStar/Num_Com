h = 0.1;
y1real = @(t) exp(t^2+2*t);
y2real = @(t) (3*t+1)^(1/3);

num_int = 1/h;
tvec = 0 + (0:num_int)*h;
tvec = tvec';
y1vec = ones(num_int+1,1);
errvec1 = zeros(num_int+1,1);
errvec1(1) = abs(y1vec(1) - y1real(0));
y2vec = ones(num_int+1,1);
errvec2 = zeros(num_int+1,1);
errvec2(1) = abs(y2vec(1) - y2real(0));
for i = 1:num_int
   y1vec(i+1) = y1vec(i) *(1+h*(tvec(i)+1))/(1-h*(tvec(i+1)+1));
   errvec1(i+1) = abs(y1vec(i+1) - y1real(tvec(i+1)));
   y2 = y2vec(i);
   y2vec(i+1) = fzero(@(y)(2*y^3-h)/(2*y^2)-(2*y2^3+h)/(2*y2^2),1);
   errvec2(i+1) = abs(y2vec(i+1) - y2real(tvec(i+1)));
end
T1 = table(tvec,y1vec,errvec1)
T2 = table(tvec,y2vec,errvec2)