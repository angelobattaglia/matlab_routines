%% Mesh plotting

[X, Y] = meshgrid([0, 1],  [1, 0]);
f1 = @(x, y) x*(x - 1)*y*(y - 1);
Z = f1(X,Y);
figure(8);
mesh(X, Y, Z);

