%% Tridiagonal Matrix Examples

% Sia A una matrice simmetrica tridiagonale di ordine 32 con gli elementi 
%della diagonale principale uguali a 16 e quelli delle codiagonali 
%(inferiore e superiore) uguali a 4 .
%Sia B una matrice di ordine 32x4, il cui j-esimo vettore colonna  e' 
%definito da elementi equispaziati in [0,j],con j=1,2,3,4 .
%Risolvere i sistemi Ax(j)=b(j). La norma 1 del vettore
%sommatoria x(j) con j=1:4 vale all'incirca?

% Building A
A = 16.*diag(ones(1,32)) + 4.*diag(ones(1,31),1) + 4.*diag(ones(1,31),-1);

% Pre-allocating B
B = zeros(32,4);

% Column Vectors
a1 = linspace(1,1,32);
a2 = linspace(1,2,32);
a3 = linspace(1,3,32);
a4 = linspace(1,4,32);

% Filling B
B(:,1) = a1';
B(:,2) = a2';
B(:,3) = a3';
B(:,4) = a4';

% Resolving the systems 
x1 = A\a1';
x2 = A\a2';
x3 = A\a3';
x4 = A\a4';

xvect = x1 + x2 + x3 + x4;

norma = norm(xvect, 1);
