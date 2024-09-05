% Integral with Trapezi Composti

f = @(x) x.^6 + 3.*x -1;

x = linspace(0,1,9);
y = f(x);

exact_value = 9/14;

t = trapz(x,y);

err_abs = abs(t - exact_value);
fprintf("The result is %.5e\n", err_abs);
