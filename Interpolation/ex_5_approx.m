% Define the function and its derivative
f = @(x) (1 - x.^2).^2.5;
df = @(x) -5.*x.*(1 - x.^2).^1.5;

% Choose a k value, for example, k = 2
k = 2;
n = 2*k;

% Generate the nodes
x = linspace(-1, 1, n+1);

% Evaluate the function at the nodes
y = f(x);

% Construct the "not-a-knot" cubic spline
pp_notaknot = spline(x, y);

% Construct the spline with specified endpoint derivatives
pp_clamped = csape(x, [df(x(1)) y df(x(end))], 'clamped');

% Plot the results
xx = linspace(-1, 1, 100);
plot(xx, f(xx), 'k-', 'LineWidth', 2); hold on;
plot(xx, ppval(pp_notaknot, xx), 'r--', 'LineWidth', 1.5);
plot(xx, ppval(pp_clamped, xx), 'b-.', 'LineWidth', 1.5);
legend({'Original function', 'Not-a-knot Spline', 'Clamped Spline'}, 'Location', 'Best');
title('Cubic Spline Interpolation');
xlabel('x');
ylabel('y');
grid on;
hold off;
