function A2_FEulerConverge

%  Demo 2:  <errors, convergence orders> 
%  Method: forward euler method
%  Example 1 (logstic eqn): y' = ry(1-y) with y(0) = y0 = 0.01, r = 10, T=1
%  Goal: to show errors vs N=T/h (errors at t=T, max(errors on (0,T));
%        to demonstrate the convergence order
%
%  Date: 2015.2.4  (revised on 9.3.2018)

% clear all previous variables
clear 

% parameters for calculation
r=10;
t0=0; y0=0.01;
tmax=1;

% right hand side, and exact sol
f= @(y) r*y*(1-y);
y_exa = @(t) 1/(1+(1-y0)/y0*exp(-r*t));

% loop used to increase N value 
imax=5;                   % total # of meshes considered
points=zeros(1,imax);
maxerror=zeros(1,imax);   % max error over [0, tmax]
pterror=zeros(1,imax);    % error at tmax

for im=1:imax
	N=10^im;
	t=linspace(t0,tmax,N+1);
	h=t(2)-t(1);
	y=y0;
	emax=0.0;
	for j=2:N+1
		yy=y+h*f(y);
		ye=y_exa(t(j));
		em=abs(yy-ye);
		if emax < em
			emax=em;
        end
		y=yy;
    end
	maxerror(im)=emax;
	pterror(im)=em;
	points(im)=N;
end

% the actual errors
disp('to display the errors')
pause
fprintf(1,['     N', '      h','        e_T   ', '   e_infty\n']);
for im=1:imax
   fprintf(1,'%6.0i   %5.E    %5.2E    %5.2E\n',[points(im), 1/points(im), pterror(im), maxerror(im)]);
end

pause

% plot the erorrs 
disp('to plot the errors')
pause

clf
% --N versus error
plot(points,pterror,'-rs')
hold on
plot(points,maxerror,'-bo')
legend('Error at T=1','Maximum Error Over [0, T]');
grid on

% define axes used in plot
xlabel('Number of Time Points')
ylabel('Error')
title('Error Using Forward Euler Method to Solve Logistic Equation')
hold off

disp('the scales differ too much')
disp('let us plot with logarithmic scale')
pause

% --N versus error: log -- 
figure 
loglog(points,pterror,'-rs')
hold on
loglog(points,maxerror,'-bo')
legend('Error at T=1','Maximum Error Over [0, T]'); 
grid on

% define axes used in plot
xlabel('Number of Time Points')
ylabel('Error')
title('Error Using Forward Euler Method to Solve Logistic Equation: logarithmic scale')
hold off

% --To find out how loglog works -- 
pause
disp('to find out how loglog works')
pause

figure
plot(log(points),log(pterror),'-rs')
hold on
plot(log(points),log(maxerror),'-bo')
legend('Error at T=1','Maximum Error Over [0, T]');
grid on

% define axes used in plot
xlabel('Log(Number of Time Points)')
ylabel('log(Error)')
title('Using Forward Euler Method to Solve Logistic Equation: Log(Error)')
hold off
