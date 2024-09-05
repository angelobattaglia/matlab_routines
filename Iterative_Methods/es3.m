% LABORATORIO 3, esercizio 3

n = 2500;
A = delsq(numgrid('S',sqrt(n)));
b = sum(A,2);

[vals, rowIndex, colIndex] = sparse2crs(A);

kmax = 10000;
tol = 1e-7;
x0 = zeros(size(b));

% Applico Gauss-Seidel nella versione matriciale, utilizzando la versione piena di A.
tic
[xMAT,kMAT,ierMAT] = gauss_seidel(full(A),b,kmax,tol,x0);
tMAT = toc

% Applico Gauss-Seidel con CRS format.
tic
[xCRS,kCRS,ierCRS] = gauss_seidel_crs(vals, colIndex, rowIndex, b, kmax, tol, x0);
tCRS = toc

% Applico Gauss-Seidel con CRS format, versione ottimizzata con calcolo vettoriale.
tic
[xCRSOPT,kCRSOPT,ierCRSOPT] = gauss_seidel_crs_opt(vals, colIndex, rowIndex, b, kmax, tol, x0);
tCRSOPT = toc

% Applico Gauss-Seidel nella versione matriciale, utilizzando la versione sparsa di A.
tic
[xMATSPARSE,kMATSPARSE,ierMATSPARSE] = gauss_seidel(A,b,kmax,tol,x0);
tMATSPARSE = toc
