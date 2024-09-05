function x = gauss_tridiag_nopiv(d,c,b)

% Gauss Algorithm for a Tri-diagonal Matrix with no Pivoting

% Let A.*x = b with A being a tridiagonal matrix, symmetrical and dominant 
% diagonal or positive definite

% INPUT
% d: vector containing the elements of the main diagonal of A
% c: vector containing the elements of the upper codiagonal 
%   (and inferior) of A
% b: vector containing the elements of the known term
% OUTPUT
% x: vector containing the solution of the system Ax=b

n = length(d);
x = zeros(n,1);
m = zeros(n-1,1);
    for k = 1:n-1
        m(k) = c(k)/d(k);
        d(k+1) = d(k+1)-m(k)*c(k);
        b(k+1) = b(k+1)-m(k)*b(k);
    end
x(n) = b(n)/d(n);
    for i = n-1:-1:1
        x(i) =(b(i)-c(i)*x(i+1))/d(i);
    end

end
