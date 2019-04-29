%% This program aims to produce a table of input value h
%% and the answer for two ways to calculate its derivative
%% and the error for them between the analytical answer

hr = 1*(10^(-1)).^(1:15); % Create the vector of h

hrt = transpose(hr); % Transpose it to make it convinient to look up in table

[yr1, yr2] = derivative1(2,hrt); % The answer by two methods


% Calculate the error from the analytical answer
error1 = abs(yr1 - 32)/32;

error2 = abs(yr2 -32)/32;

loglog(hrt, yr1);
hold on;
loglog(hrt, yr2);

function [y1, y2] = derivative1(x, h)

y1 = (x ^4 - (x - h).^4) .* h .^(-1);

y2 = (2 * x + (-h)) .* ( x^2 + (x -h).^2);

end


