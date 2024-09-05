% Define the function to integrate
f = @(x) log(x.^4 + x.^2 + 1);

% Limits of integration
a = -3;
b = 5;

% Calculate the integral with 6 intervals
I6 = Simpson_Compositi(f, a, b, 6);

% Calculate the integral with 12 intervals
I12 = Simpson_Compositi(f, a, b, 12);

% Calculate the absolute difference between the two approximations
difference = abs(I6 - I12);

% Display the results
disp(['Integral with 6 intervals: ', num2str(I6)]);
disp(['Integral with 12 intervals: ', num2str(I12)]);
disp(['Absolute difference: ', num2str(difference)]);