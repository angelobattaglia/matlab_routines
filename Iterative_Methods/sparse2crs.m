function [vals, rowIndex, colIndex] = sparse2crs(A)
%SPARSE2CRS Converte una matrice sparsa in formato CRS
%   [vals, rowIndex, colIndex] = sparse2crs(A)


% la function find lavora colonna per colonna 
% --> per avere i valori ordinati per righe do in input A'
[colIndex,I,vals] = find(A'); % I contiene gli indici di riga dei valori di A
colIndex = colIndex';
vals = vals';

n = size(A,1);
rowIndex = zeros(1,n);
pos = 1;
for i = 1:n
  while I(pos) == i-1
    rowIndex(i) = rowIndex(i) + 1;
    pos = pos + 1;
  end
end
% Dopo il ciclo for rowIndex contiene il numero di elementi non nulli per riga.
% Qui sotto calcolo la somma cumulativa, per ottenere il vettore che interessa per il CRS format
rowIndex = cumsum(rowIndex);


end

