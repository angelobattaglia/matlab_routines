f = @(x) cos(x).^2.*exp(sin(2*x));
a = 0; b1 = 2*pi; b2 = 1;
exact_value1 = 3.9774632605064206;
exact_value2 = 1.429777221309004;
n = 2.^(1:10);
err_trapezi_1 = zeros(size(n));
err_trapezi_2 = zeros(size(n));
err_Gauss_1 = zeros(size(n));
err_Gauss_2 = zeros(size(n));
for i = 1:length(n)
  I_trapezi_1 = trapezi(f,a,b1,n(i)-1);
  I_trapezi_2 = trapezi(f,a,b2,n(i)-1);
  [z,p] = zplege(n(i));
  x1 = (b1-a)/2*z + (b1+a)/2;
  w1 = (b1-a)/2*p;
  x2 = (b2-a)/2*z + (b2+a)/2;
  w2 = (b2-a)/2*p;
  I_Gauss_1 = sum(f(x1).*w1);
  I_Gauss_2 = sum(f(x2).*w2);
  err_trapezi_1(i) = abs(I_trapezi_1-exact_value1)/abs(exact_value1);
  err_trapezi_2(i) = abs(I_trapezi_2-exact_value2)/abs(exact_value2);
  err_Gauss_1(i) = abs(I_Gauss_1-exact_value1)/abs(exact_value1);
  err_Gauss_2(i) = abs(I_Gauss_2-exact_value2)/abs(exact_value2);
end

% plot dell'errore in funzione del numero di nodi
figure; loglog(n,err_trapezi_1,n,err_Gauss_1);
legend('trapezi compositi','Gauss-Legendre');
title(sprintf('\\int_0^{2\\pi} cos^2(x) e^{sin(2x)}'))
figure; loglog(n,err_trapezi_2,n,err_Gauss_2);
legend('trapezi compositi','Gauss-Legendre');
title(sprintf('\\int_0^{1} cos^2(x) e^{sin(2x)}'))

% tabelle con l'andamento degli errori nei vari casi
fprintf('%5s%12s%13s%12s%13s\n','n','Gauss, b1','trapezi, b1','Gauss, b2','trapezi, b2');
fprintf('%5d   %1.3e    %1.3e   %1.3e    %1.3e\n',[n;err_Gauss_1;err_trapezi_1;err_Gauss_2;err_trapezi_2]);
