%% More Mesh Plotting

x = linspace(-pi, +pi, 100);
y = x;

x_c = linspace(0, 2*pi, 100);
y_c = linspace(0, 2*pi, 100);

x1 = cos(x_c);
y1 = sin(y_c);

[X, Y] = meshgrid(x, y);
[X1, Y1] = meshgrid(x1, y1);

Z = sin(X.*Y);
Z1 = exp(-10.*(X1.^2+Y1.^2));

figure(12);
surf(X, Y, Z);

figure(13);
surf(X, Y, Z1);

figure(14);
mesh(X, Y, Z);

figure(15);
mesh(X, Y, Z1);
