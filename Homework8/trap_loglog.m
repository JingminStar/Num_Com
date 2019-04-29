hvec = 0.1*2.^(-(0:5));
y1real = @(t) exp(t^2+2*t);
y2real = @(t) (3*t+1)^(1/3);
error1vec = [];
error2vec = [];
red_fac1 = [];
red_fac2 = [];
for h = hvec
    num_int = 1/h;
    tvec = 0 + (0:num_int)*h;
    tvec = tvec';
    y1= 1;
    y2vec = ones(num_int+1,1);
    for i = 1:num_int
        y1 = y1 *(1+h*(tvec(i)+1))/(1-h*(tvec(i+1)+1));
        y2 = y2vec(i);
        y2vec(i+1) = fzero(@(y)(2*y^3-h)/(2*y^2)- (2*y2^3+h)/(2*y2^2),1);
    end
    y2 = y2vec(num_int+1);
    error1 = abs(y1 - y1real(1));
    error2 = abs(y2 - y2real(1));
    
    if length(error1vec) > 1
        red_fac1 = [red_fac1; error1/error1vec(length(error1vec)) ];
        red_fac2 = [red_fac2; error2/error2vec(length(error1vec)) ];
    end
    error1vec = [error1vec; error1];
    error2vec = [error2vec; error2];
    
end
 loglog(hvec,error1vec,'ro-');
 hold on
 loglog(hvec,error2vec,'bs-');
legend(  "the error of y1 at t=1", "the error of y2 at t=1" );

