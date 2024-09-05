function [x,k,ier] = Gauss_Seidel(A,b,x0,tol,kmax)
    if prod(diag(A)) == 0
        x = []; 
        k = []; 
        ier = -1;
        return
    end
    D = tril(A);
    C = A - D;
    for k = 1:kmax
        x = D\(b-C*x0);
        % Using the 2-norm
        if norm(x-x0) <= tol*norm(x)
            ier = 1;
            return
        end
    x0 = x;
    end
ier = 0;