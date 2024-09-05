%% LABORATORIO 2, esercizio 2
n = 10;
d = 4*ones(n,1);
c= -ones(n-1,1);
A = diag(d,0) + diag(c,1) + diag(c,-1);

% chiedo a MATLAB il fattore di Cholesky come matrice triangolare inferiore
R = chol(A,'lower');
% calcolo il fattore di Cholesky con la funzione implementata
myR = chol_tridiag(d,c);

% verifica
err = norm(myR-R,inf)/norm(R,inf);
if(err < eps/2)
    disp('La matrice ottenuta è equivalente a quella calcolata da MATLAB in aritmetica finita');
end
