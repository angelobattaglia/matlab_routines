% Linear Spline with interp1(x,y,z)

format short e

% The function to be approximated
f = @(x) x.^2 .* exp(-x.^2);

% if the linear spline had to be plotted, it would make sense to use z
% z = linspace(0, 1, 100000);

x = linspace(0, 1, 1000);
y = f(x);

% s = interp1(x,y,z);
err = abs(f(0.2)-interp1(x, y, 0.2))
% fprintf("The result is %.5e\n", err);
