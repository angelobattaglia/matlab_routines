% Fixed point iteration example
g  = @(x) cos(x ./ 2) + 2;

x0 = 5;
exact_value = 2.374302876933534e+00;

for i = 1:3
    x = g(x0);
    % Update
    x0 = x;
end

err_rel = abs(x - exact_value) / abs(exact_value);
% err_rel = abs(x - x0) / abs(x0);

fprintf('The result is: %.5e\n', err_rel);
