%Condizionamento in norma 1, HO GENERATO LA MATRICE DI ORDINE N 100 IL CUI
%GENERICO ELEMENTO è Aij=cos(1/min(i,j)), prima genero una matrice con
%tutti zero e poi la riempio con i due cicli for, elemento per elemento.
clc 
clear all
A=zeros(100,100);
for i=1:100
    for j=1:100
        A(i,j)=cos(1./min(i,j));
        
    end
end
A
cond(A,1) %Mi dà il condizionamento della matrice A in norma 1, la norma è 
          %indicata nel secondo slot. 