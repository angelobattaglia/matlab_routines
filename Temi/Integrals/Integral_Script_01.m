% Using Simpson's interval formula with N = 18, the definite integral 
% Integral{ exp(-x) + x^2 } is approximated by:

% Define the function
f = @(x) exp(-x) + x.^2;

% Interval [a, b] - replace 'a' and 'b' with your specific interval
a = 2; % Example start of interval
b = 4; % Example end of interval

% Number of intervals
N = 18;

% Calculate delta x
dx = (b - a) / N;

% Initialize the summation variables
sum_odd = 0;
sum_even = 0;

% Calculate the sum of odd and even terms
for i = 1:N-1
    x = a + i*dx;
    if mod(i, 2) == 0
        sum_even = sum_even + f(x);
    else
        sum_odd = sum_odd + f(x);
    end
end

% Calculate the integral approximation
integral_approx = (dx/3) * (f(a) + 4*sum_odd + 2*sum_even + f(b));

% Display the result
disp(['Approximated integral: ', num2str(integral_approx)]);
