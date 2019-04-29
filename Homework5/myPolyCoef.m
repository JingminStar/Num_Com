%% This program computes the coefficients of Newton Divided Difference  Method
%input: x and y are vectors containing the x and y coordinates
%output: coefficients c of interpolating polynomial in nested form
function c=myPolyCoef(x,y)
n=length(x);
c=zeros(size(x));
for j=1:n
v(j,1)=y(j); % Fill in y column of Newton triangle
end
for i=2:n % For column i,
for j=i:n % fill in column from top to bottom
v(j,i)=(v(j,i-1)-v(j-1,i-1))/(x(j)-x(j+1-i));
end
end
for i=1:n
c(i)=v(i,i); % Read along diagonal entries

end % for output coefficien