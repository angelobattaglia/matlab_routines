%% Application of the Secant method (Root Finding)

% Further infos @ https://en.wikipedia.org/wiki/Golden_ratio

% The correct value of Phi

Phi = ( 1 + sqrt(5) ) / 2;

% I pass the function that has Phi as one of its root if f = 0

f = @(x) x^2 -x -1;

% The starting interval

x0 = 1;
x1 = 2;

% nmax is the maximum number of iteration, tol is the tollerance

nmax = 100;
tol = 1.0e-10;

% x is an approximation of alpha
% n is the number of iteration
% ier is a flag that checks if the tollerance was met

[x, n, ier] = Secant_Method(f, x0, x1, nmax, tol);

x
Phi





