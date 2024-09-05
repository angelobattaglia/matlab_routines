% % Jacobi
% clear all
% close all
% clc
% n = 10;
% A = 10* eye(n) + diag(3*ones(7,1), 3) + diag(-5*ones(5,1),-5);
% b = A * ones(n,1);
% x = (1:10)';
% D = diag(diag(A));
% C = A - D;
% tol = 1.0e-10;
% for k = 1:1000
    % x = D\(b-C*x);    
    % if norm(b - A*x ,2) < tol*norm(b, 2)
        % break
    % end
% end
% k

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % gradiente coniugato senza precondizionamento implementato nativamente in MATLAB
% clear all
% close all
% % format long e % recommended
% clc
% n = 2000;
% A = 5* eye(n) + diag(2*ones(n-5,1), 5) + diag(2*ones(n-5,1),-5);
% b = ones(n,1);
% [x,FLAG,RELRES,ITER] = pcg(A,b)

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Gauss-Seidel
% clear all
% close all
% clc
% n = 18;
% A = 6* eye(n) + diag(-1*ones(n-1,1), 1) + diag(-1*ones(n-1,1),-1);
% b = A * ones(n,1);
% x = zeros(n,1);
% D = tril(A);
% C = A - D;
% for k = 1:5
    % x = D\(b-C*x);
% end
% err = norm(ones(n,1)-x)/norm(ones(n,1))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jacobi
clear all
close all
clc
n = 20;
A = 5* eye(n) + diag(-1*ones(n-1,1), -1) + diag(-7*ones(n-2,1),2);
b = A * ones(n,1);
x = zeros(n,1); % Pre-allocation, and also we built it this way
D = diag(diag(A));
C = A - D;
tol = 1.0e-3;
for k = 1:1000
    x = D\(b-C*x);
    if norm(b - A*x ,2)/norm(b, 2) < tol
        break
    end
end
k
