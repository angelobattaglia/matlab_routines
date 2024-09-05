% Yet another Composite Simpson
format short e

f = @(x) 3.*x.*cos(2.*x);

N = 30;
a = -1;
b = 4;

% % The Following doesn't werk
% res = composite_simpson(f, a, b, N)

res = integral(f, a, b)

