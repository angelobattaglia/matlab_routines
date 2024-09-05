% Define the function
fun = @(x) sin(-x) - x;

% Define the interval
a = 7;
b = 8;

% Choose the number of intervals (must be even for Simpson's rule)
N = 38;

% Calculate the width of each subinterval
h = (b - a) / N;

% Apply the composite Simpson's rule formula
x_values = a:h:b;
y_values = fun(x_values);

% Calculate the approximation using Simpson's rule
approximation = h/3 * (y_values(1) + 4*sum(y_values(2:2:end-1)) +   2*sum(y_values(3:2:end-2)) + y_values(end));

disp(approximation);
