% Define the function f(x)
format short e
f = @(x) x .* exp(x);

% Define the uniform partition with 5 points on the interval [0, 1]
x_nodes = linspace(0, 1, 5);

% Evaluate the function at the nodes
y_nodes = f(x_nodes);

% Find the interval [x_i, x_{i+1}] that contains x = 0.14
x_target = 0.14;
interval_index = find(x_nodes <= x_target, 1, 'last');

% Perform linear interpolation
x1 = x_nodes(interval_index);
x2 = x_nodes(interval_index + 1);
y1 = y_nodes(interval_index);
y2 = y_nodes(interval_index + 1);

% Note how the following two results are the same, despite using a direct formula and the
% native function "interp1"

% Use the formula for linear interpolation
spline_value = y1 + (y2 - y1) * (x_target - x1) / (x2 - x1)

% Using the function interp1 to evaluate the linear spline in 0.14
spline_value_2 = interp1(x_nodes, y_nodes, 0.14)

% Display the result
% disp(['The spline value at x = ', num2str(x_target), ' is approximately: ', num2str(spline_value)]);
