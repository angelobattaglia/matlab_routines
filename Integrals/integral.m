% Integral formula

f = @(x) log(4.*(x.^2) + Pi);
N = 5;

x = linspace(2,3, 2*N+1);
y = f(x);

IN = 1/(6*N) * (y(1) + 4*sum(y(2:2:2*N)) + 2*sum(y(3:2:2*N-1)) + y(end));

