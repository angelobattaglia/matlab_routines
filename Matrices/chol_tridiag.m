function R = chol_tridiag(d, c)

% QR factorization and solver for a Tri-diagonal Matrix

% Let A be tridiagonal, symmetric and positive definite

% INPUT
% d: vector containing the elements of the main diagonal of A
% c: vector containing the elements of the upper codiagonal 
%   (and inferior) of A

% OUTPUT
% R: the Cholesky factor of A, such that A = R*R'

n = length(d);
m = zeros(n-1,1);

for k = 1:n-1
    m(k) = c(k)/d(k);
    d(k+1) = d(k+1)-m(k)*c(k);
end
R = (diag(ones(n,1)) + diag(m,-1))*diag(sqrt(d));

end
