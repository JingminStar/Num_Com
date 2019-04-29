% 01.30.2019
% To demonstrate the sensitivity of root finding
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
% 1. Definitions of a set of functions 
% Example 1: (x-1/3)^3, factored and unfactored forms
myF1=@(x) (x-1/3)^3;
myF2=@(x) x^3-x^2+x/3-1/27;


% Example 2: (x-1)(x-2)...(x-6)(x-7), factored and unfactored forms
myG1=@(x) (x-1)*(x-2)*(x-3)*(x-4)*(x-5)*(x-6)*(x-7);
myG2=@(x) x^7-28*x^6+322*x^5-1960*x^4+6769*x^3-13132*x^2+13068*x-5040;
myG3=@(x,ep) myG1(x)+ep*x^7;

% 2. numerical experiments

disp('This is to demonstrate the sensitivity of root-finding problem, using fzero')
disp('example 1: look for a root for f(x)=(x-1/3)^3 around x=0.3')
pause
format long
disp('1) based on f(x) in its factored form')
fzero(@(x) myF1(x), 0.3)
pause
disp('2) based on f(x) in its unfactored form')
xc=fzero(@(x) myF2(x), 0.3)
pause
disp('3) f(xc)==?')
pause
myF2(xc)
disp('computer can not tell xc is a much less accurate approximation of the root!')
pause

format
disp('example 2: look for a root for g(x)=(x-1)(x-2)...(x-6)(x-7) around x0=')
x0=6.2
x_exa=6;
%x0=4.2
%x_exa=4;
pause
format long
disp('1) based on g(x) in its factored form')
fzero(@(x) myG1(x), x0)
pause
disp('2) based on g(x) in its unfactored form')
fzero(@(x) myG2(x), x0)
pause
disp('3) now we consider solving g(x)+ep*x^7=0, ep=10^-6')
ep=10^-6; 
xc=fzero(@(x) myG3(x,ep), x0)
pause
format
disp('3.5) let us see |xc-x_exa|/ep')
abs(xc-x_exa)/ep
pause
%disp('3.5a) let us see |xc-x_exa|/(ep*x_exp^7)')
%abs(xc-x_exa)/(ep*x_exa^7)
%pause
disp('4) now we consider solving g(x)+ep*x^7=0, ep=10^-10')
ep=10^-10; 
xc=fzero(@(x) myG3(x,ep), x0)
pause
disp('4.5) let us see |xc-x_exa|/ep')
abs(xc-x_exa)/ep
pause
%disp('4.5a) let us see |xc-x_exa|/(ep*x_exp^7)')
%abs(xc-x_exa)/(ep*x_exa^7)
%pause
disp('Suggestion: modify the second example to examine the sensitivity in capturing other roots, such as x_exa=1, 4')
