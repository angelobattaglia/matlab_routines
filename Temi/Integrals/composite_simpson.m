% Function to perform Composite Simpson's Rule integration
function I = composite_simpson(f, a, b, N)
    % Calculate the width of each subinterval
    h = (b - a) / (2*N);
    
    % Initialize the approximation sum
    I = f(a) + f(b);
    
    % Sum the terms for the interior points
    for i = 1:(2*N)
        x = a + i*h;
        if mod(i, 2) == 0
            I = I + 2 * f(x);
        else
            I = I + 4 * f(x);
        end
    end
    
    % Finalize the approximation
    I = I * (h / 3);
end
