%% Mesh plotting

x = 0:.1:1;
y = 0:.1:1;

x1 = 0:.01:1;
y1 = 0:.01:1;

[X, Y] = meshgrid(x,  y);

[X1, Y1] = meshgrid(x1, y1);

Z = X.*(X - 1).*Y.*(Y - 1);
Z1 = X1.*(X1 - 1).* sin(8.*X1) .*Y1.*(Y1 - 1) .* cos(8.*Y1);

figure(8);

mesh(X, Y, Z);

figure(9);

surf(X, Y, Z);

figure(10);

mesh(X1, Y1, Z1);

figure(11);

surf(X1, Y1, Z1);
