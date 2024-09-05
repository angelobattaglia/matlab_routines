% LABORATORIO 7, esercizio 4

f = @(x) x.^9+x.^8+x.^7+x.^2+9;
n = 5; % per avere esattezza della formula gaussiana: 9 <= 2*n-1
[p,w]=gaussq(2,n,0,0,0,[0,0]);
I = sum(f(p).*w);
exact = 1251*pi/128;
err = abs(I-exact)/abs(exact);
