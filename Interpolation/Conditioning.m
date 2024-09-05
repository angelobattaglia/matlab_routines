%% Conditioning of a matrix

a = 0;
b = 1;

ord = 2:20;
n1 = zeros(length(ord));
n2 = zeros(length(ord));
n3 = zeros(length(ord));
for n = 1:length(ord)
    x = linspace(a, b, n);
    Vn = vander(x);
    n1(n) = norm(Vn, 1);
    n2(n) = norm(Vn, 2);
    n3(n) = norm(Vn, Inf);
end

% The normInf and the norm1 should coincide in the graph
figure(1);
semilogy(ord, n1, '*', ord, n2, 'o', ord, n3, '+', 'linewidth', 3);
legend('1 Norm', '2 Norm', 'Inf Norm');
xlabel("Order of the System");
ylabel("Conditioning");

