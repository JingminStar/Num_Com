nvec = 2.^(1:4);
nvec = nvec';
mid = @(a,b) (a+b)/2;
first_point = @(a,b) mid(a,b)-(b-a)/(2*sqrt(3));
second_point = @(a,b) mid(a,b)+(b-a)/(2*sqrt(3));
f = @(x) log(x);
I_2point =  @(a,b) f(first_point(a,b))*(b-a)/2 + f(second_point(a,b))*(b-a)/2;
real_I = 4*log(4) - 3;
error = @(x) abs(x  - real_I);
I_2vec = zeros(4,1);
errorvec = zeros(4,1);
reduc_fac = zeros(4,1);
for i=1:4
    n = nvec(i);
    avec = 1+3/n*(0:n-1);
    bvec = 1+3/n*(1:n);
    I = 0;
    for j = 1:n
      I = I + I_2point(avec(j), bvec(j));  
    end
    I_2vec(i) = I;
    errorvec(i) = error(I);
    if i~=1
     reduc_fac(i) = errorvec(i-1)/errorvec(i);
    end
end
T = table(nvec,I_2vec, errorvec,reduc_fac);
