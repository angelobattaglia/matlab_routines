%% Jacobi with 9 iterations

clear all
format short e

% 
D = diag(4*ones(18, 1));
A = D + diag(-ones(17, 1), -1) + diag(-ones(17, 1), 1);

b = sum(A, 2);

C = A - D;
x = zeros(18, 1);

for i = 1:9
     x = D\(b-C*x);
end

err = norm(ones(18, 1) - x, "inf")/norm(ones(18, 1),"inf");
