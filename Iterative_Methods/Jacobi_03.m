%% Jacobi methods

% Define the matrix A
n = 20;
A = diag(5*ones(n,1)) + diag(-1*ones(n-1,1), -1) + diag(-7*ones(n-2,1), 2);

% Define the right-hand side vector b
b = sum(A, 2);

% Initialize the initial guess and the iteration count
x0 = zeros(n, 1);
k = 0;

% Set the convergence threshold
tolerance = 1e-3;

% Perform Gauss-Seidel iterations
while true
    x_new = x0;
    for i = 1:n
        x_new(i) = (b(i) - A(i, 1:i-1) * x_new(1:i-1) - A(i, i+1:n) * x0(i+1:n)) / A(i, i);
    end
    
    % Calculate the residue r(k)
    r_k = b - A * x_new;
    
    % Check for convergence
    if norm(r_k, 2) < tolerance
        break;
    end
    
    % Update the current solution and iteration count
    x0 = x_new;
    k = k + 1;
end

fprintf('Minimum number of iterations (k) required: %d\n', k);
