function [s,S]=myPartialSum(n)

s=0; S=0;

for j=1:n
    S = S+1/j;
end

for i = 1:n
    s = 1/i;
end

