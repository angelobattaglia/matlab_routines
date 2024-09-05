% Exercise on the Spline

format short e

f = @(x) x.* exp(x);
% Derivative of f
fd = @(x) exp(x) + x.*exp(x); % (?)

% The equally spaced points
x = linspace(0, 1, 4);

yd1 = fd(x(1));
ydn = fd(x(4));

% The function valued at said points
y = f(x);

% Spline evalued in the said point 0.5
s = spline(x, [yd1 y ydn], 0.5);

err = abs(f(0.5) - s);

fprintf('The absolute interpolation error at the point 0.5 is %.5e\n', err);
