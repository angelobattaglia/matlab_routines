%{  
    Calculate the polynomial interpolating the function
    f=(x)x=arctan(x(x+1)) in 8 equally spaced points of the interval
    0 and 1. How much is the interpolation error at points 0.5 and 0.7?
%}

n = 8;

%{ 
    Nodes on which to calculate the function to be approximated with a 
    polynomial
%} 

h=linspace(0,1,n);
y = @(x) atan(x.*(x+1));

% The actual function valued on the interval
fx = y(h);
fx1 = y(0.5);
fx2 = y(0.7);

% The following vector c is the coefficient of the polynomial

c = polyfit(h, fx, n-1);

% Sono i valori che assume il polinomio nel valore posto a destra

p = polyval(c, h);     
p1 = polyval(c, 0.5);
p2 = polyval(c, 0.7);

% Errors

% err1=norm(fz - p, inf);
err1 = abs(fx1 - p1); 
err2 = abs(fx2 - p2);
