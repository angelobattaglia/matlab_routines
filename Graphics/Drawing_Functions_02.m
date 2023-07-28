%% Drawing parametric functions

rho = @(t) 1 + 1/2.*cos((t).*4);
x = linspace(0, 2*pi, 1000);
xt = rho(x).* sin(x);
yt = rho(x).* cos(x);
figure(5);
plot(xt,yt);

%% Drawing parametric functions in 3D

% t ∈ [0, 10π];
t = linspace(0, 10*pi, 1000);
a = 1;
b = -0.1;
b2 = 0.1;
xt = a .* sin(t);
yt = b .* cos(t);
yt1 = b2 .* cos(t);
zt = t;
figure(6);
plot3(xt,yt,zt);
figure(7);
plot3(xt,yt1,zt);

