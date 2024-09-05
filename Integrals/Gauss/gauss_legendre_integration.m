function result = gauss_legendre_integration(tol, kmax)
    % Gauss-Legendre quadrature for the integral of exp(x) over [0, 1]
    
    % Initialize variables
    result = 0;
    prev_result = 0;
    k = 2; % Starting with n = 2
    
    % Iterate until the desired precision is achieved or kmax is reached
    while k <= kmax
        % Get nodes and weights for Gauss-Legendre quadrature
        [nodes, weights] = lgwt(k, 0, 1);
        
        % Perform the quadrature
        result = sum(weights .* exp(nodes));
        
        % Check for convergence
        if abs(result - prev_result) < tol
            break;
        end
        
        % Update for the next iteration
        prev_result = result;
        k = k + 2; % Increment by 2 for even nodes
    end
    
    fprintf('Number of nodes: %d\n', k);
    fprintf('Approximate integral value: %.10f\n', result);
end
