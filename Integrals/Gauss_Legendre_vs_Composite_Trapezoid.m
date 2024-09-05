% The integrand function
f = @(x) sin(2.*x) + cos(4.*x);

% Define the limits of integration [0, pi]
a = 0;
b = pi;

%% Composite Trapezoid
% Number of intervals is 42
m = 42;

% Calculate the width of each interval
h = (b - a) / m;

% Calculate the x values
x = linspace(a, b, m+1);

% Calculate the y values
y = f(x);

% Apply the composite trapezoidal rule
t = (b-a)/(2*m)*(y(1)+2*sum(y(2:m))+y(m+1));
fprintf('Composite Trapezoid Integral: %.10f\n', t);

%% Gauss-Legendre quadrature

% Parameters for Gauss-Legendre (ic = 1 for Legendre polynomials)
ic = 1; % Index for Legendre polynomials
alpha = 0; % Alpha parameter, unused for Legendre
beta = 0; % Beta parameter, unused for Legendre
kpts = 0; % No additional points
endpts = [0 0]; % No endpoint adjustments needed

% Calculate nodes and weights using the gaussq function
[z, w] = gaussq(ic, n, alpha, beta, kpts, endpts);

% Variable transformation for the integration bounds [a, b]
a1 = 0; % Lower bound of the integral
b1 = 1; % Upper bound of the integral
x1 = (b1-a1)/2 * z + (b1+a1)/2; % Change of variable

fx1 = f(x1);
pesi = w';

% Compute the approximate integral
app = (b1-a1)/2 * sum(pesi .* fx1); % Dot product for weighted sum

% % Calculate the error
% err_G = abs(0 - app); % Absolute error

% % Display the result
% disp(['Approximate Integral: ', num2str(app)])
% disp(['Error: ', num2str(err_G)])
