% Define the function to integrate
f = @(x) log(x.^4 + x.^2 + 1);

% Define the interval
a = -3;
b = 5;

% Approximate the integral using Composite Simpson's Rule with 6 intervals
I1 = composite_simpson(f, a, b, 6);

% Approximate the integral again using Composite Simpson's Rule with 12 intervals
I2 = composite_simpson(f, a, b, 12);

% Calculate the absolute difference between the two approximations
difference = abs(I1 - I2);

% Display the result
disp(['The absolute difference between the approximations is: ', num2str(difference)]);
