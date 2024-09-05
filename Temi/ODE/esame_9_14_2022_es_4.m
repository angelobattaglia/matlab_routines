% Heun's method application

format short e
x0 = 2; % Inizio intervallo
xN = 3; % fine intervallo
y0 = 1; % condizione iniziale
N = 8; % numero di sottointervalli

% step
h = (xN - x0) / N;

% Inizializzo x e y, e prealloco
x = (x0:h:xN)';
y = zeros(N+1, 1);
y(1) = y0;

% Function handle per f(x, y)
f = @(x, y) (x .* y) ./ ((x - 1).^2);

% Heun's method
for n = 1:N
    K1 = f(x(n), y(n));
    K2 = f(x(n) + h, y(n) + h * K1);
    y(n+1) = y(n) + (h / 2) * (K1 + K2);
end

% Soluzione esatta
y_exact = @(x) (x-1).*exp((x - 2) ./ (x - 1));

% Vettore deglie errori e il massimo di questo vettore
error = abs(y(end) - y_exact(3));

