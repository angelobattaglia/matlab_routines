% Define the order of the Gauss-Chebyshev quadrature
format long e
n = 10;

% Calculate weights and nodes for the Gauss-Chebyshev quadrature
weights = pi / n;
nodes = -cos((2*(1:n) - 1) * pi / (2*n));

% Define the integrand function, without the part that is not regular
f = @(x) x.^6 .* cos(x); % ./ sqrt(1 - x.^2);

% x = (b-a)/2*nodes+(b+a)/2;

% Evaluate the integrand at the nodes
values = f(nodes);

% Compute the Gauss-Chebyshev quadrature
integral_approx = weights * sum(values);

% Output the approximate value of the integral
% fprintf("The result is %.5e\n", integral_approx);
