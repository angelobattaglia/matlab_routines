%% 

% Parameters
a = 0;        % Start of the interval
b = 1;        % End of the interval
N = 64;       % Number of subintervals
h = (b - a) / N;  % Step size

% Initialize arrays to store the solution
x_values = zeros(N+1, 1);
y_values = zeros(N+1, 1);

% Initial conditions
x_values(1) = a;
y_values(1) = 1;  % y(0) = 1
y_prime_values = zeros(N+1, 1);
y_prime_values(1) = 1;  % y'(0) = 1


for i = 1:N
    x_values(i+1) = a + i * h;
    y_prime_values(i+1) = y_prime_values(i) + h * (2 * y_values(i) - y_prime_values(i));
    y_values(i+1) = y_values(i) + h * y_prime_values(i);
end

x_target = 1;
approximate_solution = y_values(end);
analytical_solution = exp(x_target);
absolute_error = abs(approximate_solution - analytical_solution);

fprintf('Approximate solution at x = %.2f: %.6f\n', x_target, approximate_solution);
fprintf('Analytical solution at x = %.2f: %.6f\n', x_target, analytical_solution);
fprintf('Absolute error at x = %.2f: %.6f\n', x_target, absolute_error);
