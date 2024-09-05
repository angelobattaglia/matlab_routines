% A Gauss-Seidel implementation with Relative Error compute

f = @(x) exp(x) -x.^2 + sin(x);
fd = @(x) exp(x) -2*x + cos(x);

x0 = 0.5;

alpha = -4.50066e10^-1;

for i = 1:10
 x = x0 - f(x0)/fd(x0);
 x0 = x;
end

err = abs(alpha-x)/abs(alpha)
