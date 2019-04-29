function A1_FEuler

%  Demo 1: <numerical sols> 
%  Method: forward euler method
%  Example 1 (logstic eqn): y' = ry(1-y) with y(0) = y0 = 0.01, r = 10, T=1
%  Goal: to show numerical solutions with different N=T/h 
%
%  Date: 2015.2.4 (revised on 9.3.2018)

% clear all previous variables and plots
clear 
clf

% parameters for calculation
r=10;
t0=0; y0=0.01;
tmax=1;

% right hand side, and exact sol
f= @(y) r*y*(1-y);
y_exa = @(t) 1/(1+(1-y0)/y0*exp(-r*t));

% calculate and plot exact solution
Nexa=100;
tt=linspace(t0,tmax,Nexa);
exact=zeros(1,Nexa);
for it=1:Nexa
	exact(it)=y_exa(tt(it));
end
plot(tt,exact,'k');
legend(' Exact', 'Location', 'SouthEast'); 
hold on

% define axes and title used in plot
xlabel('t-axis')
ylabel('Solution')
title('Solving Logistic Equation Using Forward Euler Method')
pause
 
% loop used to increase N value
N=1;
for icounter=1:3
	N=N*4;

	% calculate Euler solution
	t=linspace(t0,tmax,N+1);
	h=t(2)-t(1);
	euler=y0;
	y=y0;
	for j=2:N+1
		yy=y+h*f(y);
		euler=[euler, yy];
		y=yy;
    end

	% plot solution
	if icounter==1
		plot(t,euler,'--ro');
		legend(' Exact',' Euler (N = 4)', 'Location', 'SouthEast');
		pause
	elseif icounter==2
		plot(t,euler,'--b*')
		legend(' Exact',' Euler (N = 4)',' Euler (N = 16)', 'Location', 'SouthEast');
		pause
	elseif icounter==3
		plot(t,euler,'--mo')
		legend(' Exact',' Euler (N = 4)',' Euler (N = 16)',' Euler (N = 64)', 'Location', 'SouthEast');
    end

end
 
hold off