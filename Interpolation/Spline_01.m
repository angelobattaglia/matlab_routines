%% Cubic Spline not-a-knot

n = 14;
f = @(x) sin(x);

% Initializing the nodes and the interval
x_nodes = linspace(-6, 1, 14);
z = linspace(-6, 1, 150);

% Evaluating the function on the interval and on the nodes
y = f(z);
y_nodes = f(x_nodes);

% Interpolates the nodes on an "z" interval
s = spline(x_nodes, y_nodes, z);

% Plotting the spline
figure(1);
plot(z, s, "r", "LineWidth", 3);

err_abs = abs(s - y);
max_err = norm(err_abs, inf);
