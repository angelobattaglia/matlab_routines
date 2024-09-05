% Implicit Euler Method for a first-order ODE y'(x) + e^x * y(x) = 0
format short e

% Define the number of steps
N = 64;
x0 = 0;
xN = 1;
h = (xN-x0)/N; % Step size
x = (x0:h:xN)'; % Column vector for x values
y = zeros(N+1,1); % Initialize y as a column vector
y0 = 1; % Initial condition
y(1) = y0;

for n = 1:N
    g1np1 = exp(x(n+1)); % g1(x) = e^x
    y(n+1) = y(n) / (1 + h * g1np1); % Simplified as g2np1 = 0
end

exact_solution = exp(1 - exp(xN));
approximation = y(end);
absolute_error = abs(exact_solution - approximation);

disp('The absolute error at x = 1 is:');
disp(absolute_error);
