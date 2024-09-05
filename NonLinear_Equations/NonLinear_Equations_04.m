%{
Approximate the zero of the function f(x) = cos(x/2)+2−x 
using the Newton's method, starting from the value 2.
What is the approximate value of the approximation of the 
aforementioned zero obtained after 3 do you iterate?
%}

% Maximum number of iterations with the tollerance
nmax = 3;
tol = 1.0e-10;
% Starting point
x0 = 2;
% The function and its derivative
f = @(x) cos(x/2) + 2 - x;
f_d = @(x) -1/2.*sin(x/2) - 1;

% Applying the tangent method
[x, n, ier] = Tangent_Method(f, f_d, x0, nmax,  tol);

% Result should be ~ 2.3743e + 00