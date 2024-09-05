%% Find the closest fixed point to x = -1, by using the Fixed Point Method


% Define the function g(x)
g = @(x) (exp(2*x) - 2) / 2;

% Initialize the initial guess
x0 = -1;

% Number of iterations
n = 5;

% Perform fixed-point iteration
for i = 1:n
    x0 = g(x0);
end

% Calculate the "exact" value of the fixed point
exact_value = -9.207028302184803e-01;

% Calculate the relative error
relative_error = abs(x0 - exact_value) / abs(exact_value);

% Display the results
fprintf('Approximate Fixed Point after %d iterations: %.6f\n', n, x0);
fprintf('Exact Fixed Point: %.6f\n', exact_value);
fprintf('Relative Error after %d iterations: %.6f\n', n, relative_error);

