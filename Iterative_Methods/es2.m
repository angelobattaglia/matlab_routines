% LABORATORIO 3, esercizio 2
B = [4,-1,0;-1,4,-1;0,-1,4];
C = -eye(3);
A = [ B, C; C, B];

b = A * ones(size(A,2),1);
x0 = zeros(size(A,2),1);
itermax = 100;
tol = 1e-4;

D_J = diag(diag(A));
rho_J = max(abs(eig(eye(size(A)) - D_J \ A)));
D_GS = tril(A);
rho_GS = max(abs(eig(eye(size(A)) - D_GS \ A))); 
% si osserva che rho_J^2 = rho_GS.

[x_J, k_J, flag_J] = jacobi(A, b, x0, tol, itermax);
[x_GS, k_GS, flag_GS] = gauss_seidel(A, b, x0, tol, itermax);
