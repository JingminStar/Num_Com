function [s, S] = myPartialSum(n)
% to compute the partial sum of the harmonic series: 1+1/2+1/3+..+1/n
% input: n
% output: S = 1+1/2+1/3+..+1/n, s= 1/n+... 1/3+1/2+1

s=0; S=0;
for j=1:n 
    S=S+1/j;
end

for j=n:-1:1
    s=s+1/j;
end


