%% Fitting (x,y) datas with a polynomial function. 

% The coefficient of the second grade monomial

% n points to fit means that the degree of the polynomial is n-1

x = [1,2,3,4];
y = [1,-1,1,-1];
c = polyfit(x,y,3);
z = linspace(min(x),max(x));
p = polyval(c,z);
figure(1);
plot(x,y,'ro',z,p,'b');

% Value f(x) = arctan(x(x+1)) in eight equidistant points between 0 and 1.
% And .. compute the interpolation error in 0.5 and 0.7

n=8;
h = linspace(0,1,n);
y = @(x) atan(x.*(x+1));

% The Function valued in the eight points ..

f_x = y(h);

% .. and valued in 0.5 and 0.7

f_x1 = y(0.5);
f_x2 = y(0.7);

% The coefficients of the polynomial

c = polyfit(h,fx,n-1);

% The c vector of coefficients valued in the left slot

p = polyval(c, h);
p1 = polyval(c, 0.5);
p2 = polyval(c, 0.7);

% Errors

err1 = norm(fz - p, inf);
err2 = abs(fx1 - p1);
err3 = abs(fx2 - p2);
