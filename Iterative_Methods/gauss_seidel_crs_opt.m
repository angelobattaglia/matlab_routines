function [x,iter,ier] = gauss_seidel_crs_opt(vals, colIndex, rowIndex, b, kmax, tol, x0)
%gauss_seidel_crs_opt Metodo di Gauss-Seidel applicato a matrice in formato CRS. Versione
%ottimizzata sfruttando il calcolo vettoriale di MATLAB.
%   [x,iter,ier] = gauss_seidel_crs_opt(vals, colIndex, rowIndex, b, kmax, tol, x0) calcola x tale
%   che Ax = b con il metodo di Gauss-Seidel, con A memorizzata in formato CRS.
%   
%   Input:
%     - vals deve essere un vettore riga contenente gli elementi non nulli, riga per riga.
%     - colIndex deve essere un vettore riga contenente gli indici di colonna degli elementi non
%     nulli.
%     - rowIndex deve essere un vettore riga di lunghezza pari alla dimensione di A contenente, per
%     ogni riga, il numero di elementi non nulli presenti nelle righe precedenti.
%     - b e` il vettore colonna dei termini, kmax il numero massimo di iterazioni, tol la tolleranza
%     sulla differenza relativa tra due iterate, x0 la condizione iniziale.
%
%   Output: la soluzione x, il numero di iterazioni fatte iter e ier, che vale 1 se il metodo e`
%   arrivato a convergenza e 0 altrimenti.


n = length(rowIndex); % numero di righe
ier = 0;
rowIndex = [rowIndex, length(vals)]; % aggiungo a rowIndex il numero totale di elementi non nulli
for iter = 1:kmax
  x = zeros(size(x0));
  for i = 1:n
    % for k = (rowIndex(i)+1):rowIndex(i+1)
    %   j = colIndex(k);
    %   if j == i
    %     m(i) = vals(k);
    %   elseif j >= 1 && j<=i-1
    %     s(i) = s(i) + vals(k)*x(j);
    %   else % j >= i+1 && j <= n
    %     s(i) = s(i) + vals(k)*x0(j);
    %   end
    % end
    k = (rowIndex(i)+1):rowIndex(i+1);
    j = colIndex(k);
    s = vals(k(j ~= i))*[x(j >= 1 & j<=i-1);x0(j(j >= i+1 & j <= n))];
    m = vals(k(j == i));
    x(i) = (b(i)-s)/m;
  end
  

  if norm(x-x0)/norm(x) < tol
    ier = 1;
    break;
  end
  x0 = x;
end

end
