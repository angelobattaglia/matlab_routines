% Define the function to integrate
f = @(x) log(x + 3) - 12;

% Define the limits of integration
a = 2;
b = 9;

% Number of intervals
N = 26;

% Calculate the width of each interval
h = (b - a) / (2*N);

% Calculate the x values
x = a:h:b;

% Calculate the y values
y = f(x);

% Apply Simpson's composite rule
I = h/3 * (y(1) + y(end) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)));

% Display the result
disp(I);
