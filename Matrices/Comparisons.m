% Drawing a comparison the resolution of Ax = b 
% with different factorizations of A

%% Building A

n = 2500;
d = 4*ones(n, 1);
c = -ones(n-1, 1);

% diag(d, 0) puts the vector d in the diagonal an empty matrix 
% Dimensions must match. Same for diag(c, -1) and diag(c, +1)

A = diag(d, 0) + diag(c, -1) + diag(c, +1);
% sums by row
b = sum(A,2);

tic
[L, U, P] = lu(A);
y = L \ (P.*b);
x0 = U \ y;
time_PALU = toc;


tic
R = lu(A);
y = R' \ (b);
x1 = R \ y;
time_CHOL = toc;


tic
[Q, R] = qr(A);
% Q' = inv(Q)
x2 = R\(Q'.*b);
time_QR = toc;


tic
[U, S, V] = svd(A);
y = S\(U'*b);
x3 = V*y;
time_SVD = toc;