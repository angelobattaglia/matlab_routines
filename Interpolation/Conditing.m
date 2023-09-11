%% Conditioning of a matrix

a = 0;
b = 1;

ord = 2:20;
n1 = zeros(length(ord));
n2 = zeros(length(ord));
for n = 1:length(ord)
    x = linspace(a, b, n);
    Vn = vander(x);
    n1(n) = norm(Vn, 1);
    n2(n) = norm(Vn, 2);
end

figure(1);
semilogy

