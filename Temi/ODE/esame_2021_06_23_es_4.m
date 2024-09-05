% Eulero Esplicito
format short e
% x = linspace(0,1,64);
% definisco il passo
N = 64;
x0 = 0;
xN = 1;
h = (xN-x0)/N;
% h = (x(1)-x(2))/N;
% definisco gli intervalli come un vettore
x = (x0:h:xN)';
y = zeros(N+1,1);
u = zeros(N+1,1);
y0 = 1;
yd0 = 1;
y(1) = y0;
u(1) = 1;
for n = 1:N
    u(n+1) = u(n)+h*(2*u(n)-y(n));
    y(n+1) = y(n)+h*u(n);
end

% Since the exact solution is y(x) = e^x, the error at x = 1 is
exact_solution = exp(1);
approximation = y(end);
absolute_error = abs(exact_solution - approximation);
disp(absolute_error)
