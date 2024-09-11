% Find the closest fixed point to x = -1, by using the Fixed Point Method
% Implementation using a fixed-point iteration method to approximate the closest fixed-point to x = -1

% Setting the format of the output
format short e

% Define the function g(x), writte in canonical form from the previous equation, i.e. g(x) = 0
g = @(x) (exp(2*x) - 2) / 2;

% The initial guess
x0 = -1;

% Number of iterations
n = 5;

xn = x0;

% Perform fixed-point iteration
for i = 1:n
    xn = g(xn);
end

% relative_error = abs(xn - x0) / abs(x0)

% The "exact" value of the fixed point
exact_value = -9.207028302184803e-01;

% outputting the final x0
x0;

% Calculate the relative error
relative_error = abs(x0 - exact_value) / abs(exact_value)
