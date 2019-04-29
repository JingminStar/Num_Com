nvec = 2.^(1:4);
nvec = nvec';
mid = @(a,b) (a+b)/2;
first_point = @(a,b) mid(a,b)-(b-a)*sqrt(3)/(2*sqrt(5));
second_point = @(a,b) mid(a,b);
third_point = @(a,b) mid(a,b)+(b-a)*sqrt(3)/(2*sqrt(5));
f = @(x) log(x);
I_3point =  @(a,b) 5/9*f(first_point(a,b))*(b-a)/2 + ...
    8/9*f(second_point(a,b))*(b-a)/2 + 5/9*f(third_point(a,b))*(b-a)/2;
real_I = 4*log(4) - 3;
error = @(x) abs(x  - real_I);
I_3vec = zeros(4,1);
errorvec = zeros(4,1);
reduc_fac = zeros(4,1);
for i=1:4
    n = nvec(i);
    avec = 1+3/n*(0:n-1);
    bvec = 1+3/n*(1:n);
    I = 0;
    for j = 1:n
      I = I + I_3point(avec(j), bvec(j));  
    end
    I_3vec(i) = I;
    errorvec(i) = error(I);
    if i~=1
     reduc_fac(i) = errorvec(i-1)/errorvec(i);
    end
end
T = table(nvec,I_3vec, errorvec,reduc_fac);