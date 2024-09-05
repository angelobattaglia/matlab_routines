% LABORATORIO 7, esercizio 6

% applico all'integrale il cambio variabile (x,y) = (2cos(t),3sin(t))
g = @(t) exp(2*cos(t)+3*sin(t)).*sqrt((-2*sin(t)).^2+(3*cos(t)).^2); 

% funzione da integrare è periodica in [0,2*pi] --> uso trapezi composti
n = 2.^(1:10);
I_TC = zeros(size(n));
for i = 1:length(n)
  I_TC(i) = trapezi(g,0,2*pi,n(i)-1);
end
I_MATLAB = integral(g,0,2*pi); % integrale calcolato con MATLAB, che prendiamo come valore esatto
loglog(n,abs(I_TC-I_MATLAB));
title('Errore rispetto a integrale calcolato con MATLAB')
