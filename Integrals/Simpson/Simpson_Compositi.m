% Function to calculate the composite Simpson's rule
function I = Simpson_Compositi(f, a, b, n)
    % Check if the number of intervals is even
    if mod(n, 2) ~= 0
        error('The number of intervals n must be even.');
    end
    
    % Calculate the width of each interval
    h = (b - a) / n;
    
    % Initialize the approximation with the first and last terms
    I = f(a) + f(b);
    
    % Sum the terms that are multiplied by 4
    for i = 1:2:n-1
        I = I + 4 * f(a + i * h);
    end
    
    % Sum the terms that are multiplied by 2
    for i = 2:2:n-2
        I = I + 2 * f(a + i * h);
    end
    
    % Multiply by h/3 to complete the approximation
    I = I * (h / 3);
end
