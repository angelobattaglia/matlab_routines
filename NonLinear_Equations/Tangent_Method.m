function [x,n,ier] = Tangent_Method(f, f_d, x0, nmax, tol)

ier = 0;

for n = 1:nmax
    % Changes the iterative formula
    x = x0 - f(x0)/f_d(x0);
    if abs(x - x0) <= tol
        ier = 1;
        break
    end
    x0 = x;
end
