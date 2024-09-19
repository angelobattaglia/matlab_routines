% Interpolation plotting

f = @(x) sin(x)./(1 + x.^2 ./ 4);
z = linspace(-2, 2, 1000000);

x_nodi = linspace(-2, 2, 8);
y_nodi = f(x_nodi);

f_z = f(z);

c = polyfit(x_nodi, y_nodi, 7);
p = polyval(c, z);

figure(1);
plot(x_nodi, y_nodi, 'bo', 'MarkerSize', 8, 'LineWidth', 2); % Correct variable for nodes, and proper syntax for marker and line width
hold on;
plot(z, p, 'r', 'LineWidth', 2); % Polynomial interpolation
plot(z, f_z, 'k--', 'LineWidth', 1); % Actual function
hold off;

legend('Interpolation Nodes', 'Interpolating Polynomial', 'Actual Function');
title('Polynomial Interpolation vs. Actual Function');
xlabel('x');
ylabel('y');
