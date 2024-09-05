function [x, k, ier] = gauss_seidel_1(A, b, x, tol, kmax)
    n = length(b);
    
    % In the event that could turn out right
    ier = 1;
    for k = 1:kmax
        y = x(1);
        x(1) = (b(1)-A(1, 2:n)*x(2:n))/A(1,1);
        xmax = abs(x(1));
        emax = abs(x(1)-y);
        for i = 2:n
            y = x(i);
            x(i) = (b(i) - A(i, 1:i-1)*x(i-1:n)- ...
                A(i, i+1:n) * x(i+1, n))/A(i,i);
            if abs(x(i)) > xmax
                xmax = abs(x(i));
            end
            if abs(x(i)-y) > emax 
                emax = abs(x(i)-y);
            end
        end  
        % xmax = ||x^(k+1)||_\infty
        % emax = ||x^(k+1)-x^(k)||_\infty
        if emax < tol*emax
            ier = 0;
            return
        end
    end
end