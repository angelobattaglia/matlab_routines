% LABORATORIO 7, esercizio 1

choice = input('choice: ');
switch choice
  case 1
    % funzione con regolarità C^inf
    f = @(x) exp(x);
    a = 0; b = 1;
    exact_value = exp(1)-1;
  case 2
    % funzione con regolarità C^inf
    f = @(x) cos(x);
    a = 0; b = 1;
    exact_value = sin(1);
  case 3
    % la funzione integranda ha una singolarità molto vicina all'estremo
    % inferiore dell'intervallo di integrazione
    f = @(x) x.^(-4);
    a = 0.01; b = 1.1;
    exact_value = 1/3*(1e6 - (1.1)^(-3));
  case 4
    % la derivata prima dell'integranda ha una singolarità per x = 0
    f = @(x) sqrt(x);
    a = 0; b = 1;
    exact_value = 2/3;
  case 5
    % funzione molto oscillante: servono molti nodi di quadratura per
    % risolvere correttamente l'andamento della funzione    
    f = @(x) sin(99*pi*x);
    a = 0; b = 1;
    exact_value = 2/(99*pi);
  case 6 
    % funzione dispari sull'intervallo: la formula di quadratura calcola
    % esattamente l'integrale nullo con due nodi di quadratura
    f = @(x) sin(100*pi*x);
    a = 0; b = 1;
    exact_value = 0;
end

tol = 1e-10;
kmax = 128;
n = 2:2:kmax;
I = zeros(size(n));
err = zeros(size(n));
for i = 1:length(n)
  [refp,refw] = zplege(n(i));
  p = (b+a)/2 + (b-a)/2*refp;
  w = (b-a)/2*refw;
  I(i) = sum(f(p).*w);
  err(i) = abs(I(i)-exact_value);
  if err(i) < tol
    break
  end
end

loglog(n(1:i),err(1:i))

% tabella dei valori dell'errore e dell'integrale approssimato
fprintf('%10s\t%10s\t%10s\n\n','n','approssimazione','errore');
fprintf('%10d\t%1.6e\t%1.6e\n',[n(1:i);I(1:i);err(1:i)]);
