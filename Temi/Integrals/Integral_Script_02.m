% Using the formula of composite trapezoids with intervals N=85 , 
% the definite integral is approximated by 
% Integral{ 7*exp(5-x) } in [1, 4]

% Define the function
f = @(x) 7 * exp(5 - x);

% Interval [a, b]
a = 1; % Start of interval
b = 4; % End of interval

% Number of intervals
N = 85;

% Calculate delta x
dx = (b - a) / N;

% Initialize the sum variable
sum_f = 0;

% Calculate the sum of function values at interior points
for i = 1:N-1
    x = a + i*dx;
    sum_f = sum_f + f(x);
end

% Calculate the integral approximation
integral_approx = (dx/2) * (f(a) + 2*sum_f + f(b));

% Display the result
disp(['Approximated integral: ', num2str(integral_approx)]);
