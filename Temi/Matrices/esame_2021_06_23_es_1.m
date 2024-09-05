% Gauss-Seidel with residual vector check

n = 20;
A = 5*eye(n) + diag(-1*ones(n-1,1), -1) + diag(-7*ones(n-2,1), 2);
b = A * ones(n,1);
x = zeros(n,1);
% Preparing the iteration matrix
D = tril(A);
C = A - D;
% Starting Flag set to false
flag = false;
% the starting point of the residual vector
r = b-A*x;
iterata = 0;

while ~flag
    % Gauss-Seidel Method
    x = D\(b-C*x); 
    r = b-A*x;
    if norm(r, 2) < 10^-3
        flag = true;
    end
    iterata = iterata + 1;
end
