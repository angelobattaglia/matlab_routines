%% LABORATORIO 2, esercizio 1

n = 10;
d = 4*ones(n, 1);
c = -ones(n-1,1);
A = diag(d,0) + diag(c,1) + diag(c,-1);
autovalori_A = eig(A);

% Checking if the said matrix is a positive definite matrix
if all(autovalori_A > 0)
    disp('A is a positive definite matrix');
end

% Summing up all the rows, so that x_m equals [1, ..., 1]
b = sum(A, 2);
x_m = A\b;
x = gauss_nopivoting_tridiag(d, c, b);

differenza_relativa = norm(x_m - x)/norm(x);
if differenza_relativa < eps/2
    disp('le due soluzioni sono equivalenti in aritmetica finita')
end
