% Define the function f(x)
f = @(x) exp(-x.^2 + 1) .* log(1 ./ (x.^4 + 1));

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
p = polyval(p_coeffs, 2.5)
