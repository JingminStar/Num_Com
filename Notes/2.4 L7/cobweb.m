function cobweb(f,a, b, x0, N)
% generate the cobweb diagram associated with
% the iteration: x_{n+1}=f(x_n).
% N is the number of iterates, and
% (a,b) is the interval
% x0 is  the initial point.


% plot y=f(x)
x=a:0.01:b;
y=f(x);
figure
% turn hold on to gather up all plots in one
hold on;
title('cobweb diagram')
plot(x,y,'k'); % plot the function
pause
plot(x,x,'r'); % plot the straight line
pause
x(1)=x0; % plot orbit starting at x0
for i=1:N
    x(i+1)=f(x(i));
    if i==1
        line([x(i),x(i)],[0,x(i+1)]);
    else 
        line([x(i),x(i)],[x(i),x(i+1)]);
    end
    pause
    line([x(i),x(i+1)],[x(i+1),x(i+1)]);
    pause
end
hold off;

