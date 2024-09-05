% LABORATORIO 7, esercizio 3

% int_1^inf exp(-x)x^3/2 dx = int_0^inf exp(-(t+1))(t+1)^(3/2) dt
%                           = int_0^inf exp(-t)exp(-1)(t+1)^(3/2) dt
% con il cambio variabile t = x-1

f = @(t) exp(-1)*(t+1).^(3/2);
exact_value = 5/(2*exp(1)) + 3/4*sqrt(pi)*(1-erf(1));
tol = 1e-10;
kmax = 128;
n = 2:2:kmax;
I = zeros(size(n));
err = zeros(size(n));
for i = 1:length(n)
  [p,w] = gaussq(6, n(i), 0, 0, 0, [0,0]);
  I(i) = sum(f(p).*w);
  err(i) = abs(I(i)-exact_value)/abs(exact_value);
  if err(i) < tol
    break;
  end  
end

loglog(n(1:i), err(1:i)) % grafico dell'errore fino all'iterata i

% tabella dell'errore e dell'integrale approssimato fino all'iterata i
fprintf('%10s\t%10s\t%10s\n\n','n','approssimazione','errore');
fprintf('%10d\t%1.8e\t%1.8e\n',[n(1:i);I(1:i);err(1:i)]);
