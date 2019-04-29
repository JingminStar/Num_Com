%% Check spectrum radius
r=[4,10,20,50,100];
for ra = r
randn('seed',20190227);
A = randn(ra);
for i =1:ra
   for j = 1:ra
       A(i,i) = abs(A(i,i))+abs(A(i,j));
   end
          q = randn();
       if q >=0 
           q = 1; 
       else
           q=-1; 
       end
       A(i,i) = q * (A(i,i)+abs(randn()));
end

D = diag(diag(A));
U = triu(A,1);
L =  tril(A,-1);
B_Jacobi = inv(D)*(U+L);
B_GS = inv(D+L)*U;
fprintf(' r=%3i, The spectral radius of B for Jacobi is %5.4f, for GS is %5.4f\n',ra, max(abs(eig(B_Jacobi))), max(abs(eig(B_GS))));
end