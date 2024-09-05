%% Conditioning, part II

% Let's define the vector b such that the Vn.*x = b linear system solves
% for x = (1, ... , 1)

a = 0;
b = 1;

ord = 2:20;
% Doesn't matter if it's zeroes(n) or ones(n), the purpose is just to
% pre-allocate a vector with some values

err = zeros(length(ord));
for n = 1:length(ord)
    x = linspace(a,b,ord(n));
    Vn = vander(x);
    % We will use the function sum(A, 2) which sums each row of the Matrix
    t = sum(Vn, 2);
    % .. so that z is a vector of the form [1, ..., 1]
    z = Vn\t;
    err(n) = norm( z - ones(ord(n),1) ) / norm( ones(ord(n),1) );
end

figure(2);
semilogy(ord, err, 'o', 'linewidth', 3);
xlabel('Order of the System');
ylabel('Error');


