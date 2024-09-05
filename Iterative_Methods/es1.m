% LABORATORIO 3, esercizio 1
A_1 = [ 1, -2, 2; -1, 1, -1; -2, -2, 1 ];
A_2 = [ 4, 0, 2/5; 0 5 2/5; 5/2, 2, 1 ];
A_3 = [ 2, -1, 1; 2, 2, 2; -1, -1, 2 ];
A_4 = 3*eye(6) - diag(-ones(5,1),-1) - diag(-ones(5,1),+1);
A_4(6,1) = -1; A_4(5,2) = -1; A_4(2,5) = -1; A_4(1,6) = -1;
tol = 1e-7;
kmax = 100;

% JACOBI: Calcolo degli autovalori
rhoJ_1 = max(abs(eig(eye(size(A_1)) - diag(diag(A_1)) \ A_1)));
rhoJ_2 = max(abs(eig(eye(size(A_2)) - diag(diag(A_2)) \ A_2)));
rhoJ_3 = max(abs(eig(eye(size(A_3)) - diag(diag(A_3)) \ A_3)));
rhoJ_4 = max(abs(eig(eye(size(A_4)) - diag(diag(A_4)) \ A_4)));
[xJ_1,kJ_1,ierJ_1] = jacobi(A_1,sum(A_1,2),zeros(size(A_1,1),1),tol,kmax);
[xJ_2,kJ_2,ierJ_2] = jacobi(A_2,sum(A_2,2),zeros(size(A_2,1),1),tol,kmax);
[xJ_3,kJ_3,ierJ_3] = jacobi(A_3,sum(A_3,2),zeros(size(A_3,1),1),tol,kmax);
[xJ_4,kJ_4,ierJ_4] = jacobi(A_4,sum(A_4,2),zeros(size(A_4,1),1),tol,kmax);

% GAUSS-SEIDEL
rhoGS_1 = max(abs(eig(eye(size(A_1)) - tril(A_1) \ A_1)));
rhoGS_2 = max(abs(eig(eye(size(A_2)) - tril(A_2) \ A_2)));
rhoGS_3 = max(abs(eig(eye(size(A_3)) - tril(A_3) \ A_3)));
rhoGS_4 = max(abs(eig(eye(size(A_4)) - tril(A_4) \ A_4)));
[xGS_1,kGS_1,ierGS_1] = gauss_seidel(A_1,sum(A_1,2),zeros(size(A_1,1),1),tol,kmax);
[xGS_2,kGS_2,ierGS_2] = gauss_seidel(A_2,sum(A_2,2),zeros(size(A_2,1),1),tol,kmax);
[xGS_3,kGS_3,ierGS_3] = gauss_seidel(A_3,sum(A_3,2),zeros(size(A_3,1),1),tol,kmax);
[xGS_4,kGS_4,ierGS_4] = gauss_seidel(A_4,sum(A_4,2),zeros(size(A_4,1),1),tol,kmax);
