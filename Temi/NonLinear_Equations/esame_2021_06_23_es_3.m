% Drawing a comparison between Newton's method for nonlinear equations and Polynomial Approximation

format short e

f = @(x) x.^3 + x - 1;
% Derivative of f
f_d = @(x) 3.*x.^2 + 1;

% Starting point of the iteration
x0 = 1;

x = linspace(0, 1, 4);
y = f(x);

% Evaluate the polynomial, first the coefficients, later the roots command 
c = polyfit(x, y, 3);
r = roots(c);
right_value = r(3);

% Newton's method (or tangent method) for three iterates
for n = 1:3
    % Changes the iterative formula
    x = x0 - f(x0)/f_d(x0);
    % if abs(x - x0) <= tol
        % ier = 1;
        % break
    % end
    x0 = x;
end

% Considering roots(c) the actual value of the root
err_rel = abs(x0 - right_value)/abs(right_value)

% fprintf('The relative interpolation error at the point 0.5 is %.5e\n', err_rel);
