% LABORATORIO 2, esercizio 3
% matrice con 4 sulla diagonale 0, -1 sulle diagonali 1 e -1
N = 2500;
A = diag(4*ones(N,1),0) + diag(-ones(N-1,1),1) + diag(-ones(N-1,1),-1);
b = A*ones(N,1);
%% LU
tic
[L,U,P] = lu(A); % LUx=Pb ---> Ux=L\(P*b) ---> x=U\(L\P*b)
y = L\(P*b); xLU = U\y;
tLU = toc;
%% cholesky
tic
R = chol(A); % A= R'*R
y = R'\b; xCHOL = R\y;
tCHOL = toc;
%% QR
tic
[Q,R]= qr(A);
xQR = R\(Q'*b);
tQR = toc;
%% SVD
tic
[U,S,V] = svd(A);
y = S\(U'*b); xSVD = V*y;
tSVD = toc;
