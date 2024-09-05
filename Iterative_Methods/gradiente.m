function [x,k,ier] = gradiente(A, b, x, tol, kmax)
ier = 0;
r = b-A*x;
for k = 1:kmax
  s = A*r;
  alpha = r'*r/(r'*s);
  x = x+alpha*r;
  r = r-alpha*s;
  if norm(r) <= tol*norm(b)
    ier = 1;
    break
  end
end
