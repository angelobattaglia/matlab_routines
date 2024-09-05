% Define the function to interpolate
f = @(x) exp((-x.^2) / 3) .* sin(x);

% Devo interpolarla su [-2, 4] in 7 nodi
a = -2;
b = 4;
n_nodes = 7;

% Computo i nodi equispaziati
x_nodes = linspace(a, b, n_nodes);

% Calcolo la funzione nei nodi
y_nodes = f(x_nodes);

% Genero un dominio denso di punti per plottare il polinomio e la funzione
x_dominio = linspace(a, b, 1000);
y = f(x_dominio);

% Uso polyfit per ottenere i coefficienti del polinomio interpolante
p_coeffs = polyfit(x_nodes, y_nodes, n_nodes-1);

% Valuto effettivamente il polinomio
p = polyval(p_coeffs, x_dominio);

figure;
% Plotto i nodi
plot(x_nodes, y_nodes, 'ko', 'MarkerFaceColor', 'k');
% 'MarkerFaceColor', 'k' fills the inside of the circles with black color.
hold on; % Scrivo 'hold on' così da ritenere i punti, si mette dopo il primo plot

% Plotto il polinomio
plot(x_dominio, p, 'r--', 'LineWidth', 2);
% Plotto la funzione
plot(x_dominio, y, 'b-', 'LineWidth', 2);

% Chiamo gli assi 'x' e 'y'
xlabel('x');
ylabel('y');

% Titolo il grafico
title('Function f(x) and its interpolating polynomial p(x)');

% Aggiungo una legenda (When you use 'Location', 'Best', MATLAB calculates
% the least obtrusive placement)
legend('Interpolating nodes', 'Interpolating polynomial p(x)', 'Original Function', 'Location', 'Best');

% Metto una griglia come sfondo del plot
grid on;
% Rilascia il plot, così che non si sovrappongano
hold off;
