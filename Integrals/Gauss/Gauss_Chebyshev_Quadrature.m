% I=[1,1], with the function x*exp(x) with 32 nodes

% Define the function to be integrated
% g = @(x) x .* exp(x); % Wrong
g = @(x) x.*exp(x).*sqrt(1-x.^2); 

% Number of quadrature nodes
n = 32;

% Chebyshev nodes on the interval [-1, 1]
% x = cos(((2*(1:n)-1)*pi)/(2*n)); % Wrong
x = cos((2*(1:n)-1)*pi/(2*n)); 

% Since we're integrating from 1 to 1, which is a zero-width interval,
% the integral of any function over this interval is 0. This looks like a typo.
% If the limits are supposed to be from -1 to 1, then we can use the nodes as calculated.
% Otherwise, we need the correct limits of integration.

% Gauss-Chebyshev quadrature formula
int = pi * sum(g(x)) / n;
% Display the result
disp(['The approximate integral is: ', num2str(int)]);
