% Jacobi

n = 100;
A = 3*eye(n) + diag(ones(n-1, 1), -1) + diag(ones(n-1, 1), + 1);

sol = ones(n, 1);
b = A*sol;

D = diag(diag(A));
C = A - D;

x0 = linspace(0, 1, 20);

for i = 1:20
    x0 = D\(b-C*x);
    x = x0;
end

err = norm(abs(x - x0), inf);

fprintf('The result is: %.5e\n', err);
