function NumQ_demo
%
%  Integrate f(x) over [a, b] using midpoitn, trap, simpson's rule, 2-pt Gaussian 
% 
%  Inputs: (possible)
%        a = left endpoint of interval
%        b = right endpoint of interval
%        n = number of subintervals
%  In this example: f(x)=exp(3x), a=0, b=1
%
%  Note: based on fig6_8, also include 2-pt Gauss
 
display('This demo is to compare four numerical integration rules,')
display('in their composite form, ')
display('applied to integrate f(x)=exp(3x) over [0,1]')
pause
a=0; b=1;
exact=(exp(3)-1)/3;
 
% midpoint
display('for midpoint rule:')
nkm=7;
intervm=[10 20 40 80 160 320 640];
M=zeros(1,nkm); errm=zeros(1,nkm);
for k=1:nkm
    n=intervm(k);
    xd=linspace(a,b,n+1);
    h=xd(2)-xd(1);
    sum=f(xd(1)+0.5*h);
    for j=2:n
        sum=sum+f(xd(j)+0.5*h);
    end;
    M(k)=h*sum;
    errm(k)=abs(exact-M(k));
       fprintf(' n =  %i  I_M = %10.8f  E_M = %8.3e \n ',intervm(k),M(k),errm(k));
end;
pause
 
 
% trap
display('for trapzoidal rule:')
nkt=7;
intervt=[10 20 40 80 160 320 640];
T=zeros(1,nkt); errt=zeros(1,nkt);
for k=1:nkt
    n=intervt(k);
    xd=linspace(a,b,n+1);
    h=xd(2)-xd(1);
 
    sum=0.5*f(xd(1));
    for j=2:n
        sum=sum+f(xd(j));
    end;
    T(k)=h*(sum+0.5*f(xd(n+1)));
    errt(k)=abs(exact-T(k));
           fprintf(' n =  %i  I_T = %10.8f  E_T = %8.3e \n',intervt(k),T(k),errt(k));
end;
pause
 
 
%  simpson
display('for simpson rule:')
nks=7;
intervs=[10 20 40 80 160 320 640];
S=zeros(1,nks); errs=zeros(1,nks);
for k=1:nks
    n=intervs(k);
    xd=linspace(a,b,n+1);
    h=xd(2)-xd(1);
    sum=f(xd(1));
    for j=2:2:n
        ff2=f(xd(j+1));
        sum=sum+4*f(xd(j))+2*ff2;
    end;
    S(k)=h*(sum-ff2)/3;
    errs(k)=abs(exact-S(k));
           fprintf(' n =  %i  I_S = %10.8f  E_S = %8.3e \n',intervs(k),S(k),errs(k));
end;
pause
 
%  2-point gaussian quadrature
display('for 2-pt Gaussian:')
nkg=7;
intervg=[10 20 40 80 160 320 640];
G=zeros(1,nkg); errG=zeros(1,nkg);
for k=1:nkg
    n=intervg(k);
    xd=linspace(a,b,n+1);
    h=xd(2)-xd(1);
    c1=0.5*h*(1-1/sqrt(3));
    c2=0.5*h*(1+1/sqrt(3));
    sum= 0;
    for j=1:n
        sum=sum+f(xd(j)+c1)+f(xd(j)+c2);
    end;
    G(k)=0.5*h*sum;
    errG(k)=abs(exact-G(k));
           fprintf(' n =  %i  I_S = %10.8f  E_S = %8.3e \n',intervg(k),G(k),errG(k));
end;

pause 
% plot error using loglog plot
 
display('next, plot errors in loglog format')
pause
clf
% get(gcf)
set(gcf,'Position', [25 1115 658 230])
co = [0 0 1;
      0 0.5 0;
      1 0 0;
      0 0.75 0.75;
      0.75 0 0.75;
      0.75 0.75 0;
      0.25 0.25 0.25];
%set(groot,'defaultAxesColorOrder',co)
 
loglog(intervm,errm,'-db','MarkerSize',9,'LineWidth',1.6)
hold on
loglog(intervt,errt,'--or','MarkerSize',9,'LineWidth',2)
loglog(intervs,errs,'-.*k','MarkerSize',9,'LineWidth',1.3)
loglog(intervg,errG,'-dg','MarkerSize',9,'LineWidth',1.6)
grid on
xlabel('n-axis')
ylabel('Error')
 
%  get(legend)
%  'Position',[left, bottom, width, height]
legend({' Midpt',' Trap',' Simp', '2-pt Gauss'},'Position',[0.18 0.22 0.15 0.27])
 
set(gca,'FontSize',16,'FontWeight','bold')
set(findobj(gcf,'tag','legend'),'FontSize',16,'FontWeight','bold')
     
disp('Final questions: what is the slope of each curve; why are they straight lines?')

function y=f(x)
y=exp(3*x);
 
