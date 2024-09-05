% Explicit Euler Method for a second-order ODE
format short e

% Define the number of steps
N = 8;
x0 = 0;
xN = 1;
h = (xN-x0)/N;  % Step size

% Initialize vectors for x, y, and u (where u is dy/dx)
x = (x0:h:xN)';
y = zeros(N+1,1);
u = zeros(N+1,1);

% Initial conditions
y(1) = 0;
u(1) = 0;

% Apply the Explicit Euler method
for n = 1:N
    u(n+1) = u(n) + h * (2*cos(x(n)) - y(n));
    y(n+1) = y(n) + h * u(n);
end

% Exact solution is y(x) = x*sin(x)
exact_solution = xN * sin(xN);
approximation = y(end);
absolute_error = abs(exact_solution - approximation);
disp('The absolute error at x = 1 is:');
disp(absolute_error);
