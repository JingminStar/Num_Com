%% This program is to interplate f(x) = 1/(1+4x^2) with uniformly distributed x

n = 6; %We uniform distributed n points in [-2,2]
f = @(x) (1./(1+4.*x.^2)); % Define f(x)

%Initialize (x_j, y_j)
x=linspace(-2,2,n);
y=arrayfun(f,x);

%% Find the interpolation function
fprintf('n = %i\n',n);
%Find Coefficient
a = myPolyCoef(x,y);
for i = 1:n
    fprintf('a(%i) = % 15.14f\n', i, a(i));
end

%Find the polynomial function
p = @(b) a(n);
for j = n-1:-1:1
 p = @(b) p(b)*(b-x(1,j))+a(j);
end
x1=linspace(-2,2,200);

%Find the function value for each x
polyvec=zeros(1,200);
for i = 1:200
    polyvec(1,i) = p(x1(1,i));
end

%Draw the graph
plot(x1,f(x1));  
hold on
plot(x1,polyvec,'.');  
legend("f(x)", "p(x)");