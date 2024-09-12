% which command
% >> which filename
% finds the path to the file named "filename" into the file system

% Sparse matrices

n = 3;

% Sparse identity matrix
% S = speye(n) returns a sparse n-by-n identity matrix, with ones on the main diagonal and zeros elsewhere.
% S = speye(n,m) returns a sparse n-by-m matrix, with ones on the main diagonal and zeros elsewhere.
% https://www.mathworks.com/help/matlab/ref/speye.html
I = speye(n);


% Create sparse matrix
% sparse https://www.mathworks.com/help/matlab/ref/sparse.html
% S = sparse(i,j,v,m,n,nz) allocates space for nz nonzero elements. Use this syntax to allocate extra space for nonzero values to be filled in after construction.
% S = sparse(A) converts a full matrix into sparse form by squeezing out any zero elements. If a matrix contains many zeros, converting the matrix to sparse storage saves memory.
% S = sparse(m,n) generates an m-by-n all zero sparse matrix
% S = sparse(i,j,v) generates a sparse matrix S from the triplets i, j, and v such that S(i(k),j(k)) = v(k). The max(i)-by-max(j) output matrix has space allotted for length(v) nonzero elements.
I = sparse(1:n,1:n,ones(n,1))

% Extract nonzero diagonals and create sparse band and diagonal
% spdiags https://www.mathworks.com/help/matlab/ref/spdiags.html
I = spdiags(ones(n,1),0,n,n)
I = spdiags(ones(n,1),1,n,n)
 