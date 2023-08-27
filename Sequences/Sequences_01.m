%% Sequences

N = 100;
x = zeros(1,N);
z = zeros(1,N);

x(1) = 2;
z(1) = 2;

for n = 2:N
  x(n) = 2^(n-1/2) * sqrt(1 - sqrt(1 - 4^(1-n)*x(n-1)^2));
  z(n) = z(n-1) * sqrt(2 / (1 + sqrt(1 - 4^(1-n)*z(n-1)^2)));
end

% Plotting the relative error onto one figure

figure(16);
loglog(1:N, abs(x-pi), 1:N, abs(z-pi));
