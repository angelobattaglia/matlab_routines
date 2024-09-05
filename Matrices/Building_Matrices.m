%% Building Matrices

% Column and Row vector [4, 4, 4, 4]
d = 4*ones(4, 1);
d_t = 4*ones(4, 1)';

% Tridiagonal symmetric matrix with dominant diagonal or
% definite positive

%1)MATRICE eye(n) genera una matrice quadrata di ordine NxN IDENTICA, CON
% TUTTI GLI ELEMENTI ALLOCATI SULLA DIAGONALE PRINCIPALE!! QUINDI
%MOLTIPLICO PER -2 PER AVERE UNA MA
%2)MATRICE diag(m,n); m è un vettore e me lo posiziona su una diagonale di 
%una matrice NxN.
%3)MATRICE ones(m,n) GENERA UNA MATRICE DI M RIGHE E N COLONNE CON TUTTI 
%ELEMENTI UGUALI A UNO 1.

A_00 = -2*eye(5) + diag(ones(1,4),1) + diag(ones(1,4),-1);

% MATRICE IMPORTANTE
A_01 = -2*eye(5)+diag(ones(1,4),1)+diag(ones(1,4),-1);

