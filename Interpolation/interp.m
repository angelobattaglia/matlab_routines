% Computing the Lagrange Polynomial
function p = interp(x, a, z, n)

N = length(z);
% p = a(n+1);
p = zeros(size(z));

for i = n:-1:1
    p = p(z - x(i)) + a(i);
end

