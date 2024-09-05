%% Application of the Jacobi Method

n = 10;
A = 10*eye(n) + 3*diag(ones(1,n-3), 3) + -5*diag(ones(1,n-5), -5);
% Defining b so that x = A\b is the vector [1, ..., 1]
b = sum(A, 2);

x0 = (1:10)';


