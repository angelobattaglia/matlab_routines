% Newton Rhapson algorithm displayed step-by-step
% Define the function and its derivative
f = @(x) cos(x/2) + 2 - x;
f_prime = @(x) -0.5*sin(x/2) - 1;

% Initial guess
x_n = 2;

% Display header for iterations
disp('n     x_n         f(x_n)       f''(x_n)     x_{n+1}');

% Perform 3 iterations of the Newton-Raphson method
for n = 1:3
    f_n = f(x_n);
    f_prime_n = f_prime(x_n);
    x_next = x_n - f_n / f_prime_n;
    
    % Display iteration details
    fprintf('%d     %f    %f    %f    %f\n', n, x_n, f_n, f_prime_n, x_next);
    
    % Update for next iteration
    x_n = x_next;
end

% Final approximation
disp(['The approximate value of the zero after 3 iterations is: ', num2str(x_n)]);
