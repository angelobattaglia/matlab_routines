%% LU Factorization

A=20.*diag(ones(1,42))+4.*diag(ones(1,41),1)+4.*diag(ones(1,41),-1);
b=linspace(-1,1,42);
autovalori=eig(A);
[L, U]=lu(A);
y=L\b';
x=U\y;
vect=x+y;
norma=norm(vect,inf);






















