% LABORATORIO 7, esercizio 2

% exp(-x^2)*f(x^2) è pari 
% --> int_0^inf exp(-x^2)*f(x^2) = 0.5*int_-inf^inf exp(-x^2)*f(x^2)
f = @(x)x.^2.*sin(x.^2);
exact_value = 2^(1/4)/16*sqrt(pi*(sqrt(2)+2));
tol = 1e-10;
kmax = 128;
n = 2:2:kmax;
I = zeros(size(n));
err = zeros(size(n));
for i = 1:length(n)
  [p,w] = gaussq(4, n(i), 0, 0, 0, [0,0]);
  I(i) = 0.5*sum(f(p).*w);
  err(i) = abs(I(i)-exact_value)/abs(exact_value);
  if err(i) < tol
    break;
  end
end

loglog(n(1:i), err(1:i)) % grafico dell'errore fino all'iterata i

% tabella dell'errore e dell'integrale approssimato fino all'iterata i
fprintf('%10s\t%10s\t%10s\n\n','n','approssimazione','errore');
fprintf('%10d\t%1.8e\t%1.8e\n',[n(1:i);I(1:i);err(1:i)]);
