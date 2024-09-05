%% Application of the Secant method (Root Finding)
format long

% The correct value
alpha = sqrt(2); % (Around 1.414213562373095) 

% I pass the f(x) as an "anonymous" function (i.e. Symbolically)

f = @(x) x^4 - 4;

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

% Comparing the two values

x
alpha


