%% Application of the Tangent method (Root Finding)

format long

% The correct value
alpha = sqrt(2); % (Around 1.414213562373095) 

% I pass the f(x) as an "anonymous" function (i.e. Symbolically)

f = @(x) x^4 - 4;
f_d = @(x) 4*(x^3);

% The starting point (the first approximation that we decide to put)

x0 = 1;

% nmax is the maximum number of iteration, tol is the tollerance

nmax = 100;
tol = 1.0e-10;

% x is an approximation of alpha
% n is the number of iteration
% ier is a flag that checks if the tollerance was met

[x, n, ier] = Tangent_Method(f, f_d, x0, nmax, tol);

% Comparing the two values

x
alpha


