%
n = 18;
A = 6*eye(n) - diag(ones(n-1,1),1) - diag(ones(n-1,1),-1);

x_true = ones(n, 1);
b = A * x_true;

% I set the tolerance
toll = 10.^-15;

D = tril(A); % Lower triangular part of A, including diagonal
U = A - D; % Upper triangular part and the diagonal elements set to 0

% Assuming 'x' is the initial guess, which was missing
x = zeros(n, 1); % Starting with a zero vector as initial guess

k = 0;
itermax = 5;
flag = true;
while k <= itermax && flag
    x_prev = x;
    x = D\(b-U*x);

    err = norm(x-x_prev, inf) / norm(x, inf);
    k = k + 1;
    flag = err >= toll;
end


flag = ~flag; % 'not' operator in MATLAB is '~'
