% Simpson's formula (of course not)

% format short e

f = @(x) exp(-1.*x.^2);

N = 50;
a = -1;
b = 1;

res = integral(f, a, b)


