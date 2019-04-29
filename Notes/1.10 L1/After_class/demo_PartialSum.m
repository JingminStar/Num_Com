% This is to demonstrate the difference in ordering 
% when computing the partial sum of the Harmonic series
% 
% 2019.01
%%%%%%%%%%%%%%

index = [10, 10^3, 10^5, 10^6, 10^7];
N = length(index);
for j = 1:N
    [s, S] = myPartialSum(index(j));
    index(j)
    s - S
    pause
end

