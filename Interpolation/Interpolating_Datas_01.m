%% Polyfit and Polyval

f = @(x) sin(pi*x);
ord = 2:20;

interval = linspace(0, 1, 1000);

for n = 1:length(ord)
    
    % x is the x-axis coordinates of the points to interpolate
    % f(x) is the y-axis coordinates of the points to interpolate
    x = linspace(0, 1, ord(n));

    %  c is the coefficients of the polynomial form that interpolates
    %  the points. In MATLAB this represent the polynomial itself
    c = polyfit(x, f(x), ord(n) - 1);

    % Polyval takes this polynomial form and evaluates on an interval
    p = polyval(c, interval);
    
    % plotting the function, the points and the polynomial interpolation
    plot(interval, f(interval), 'r', x, f(x), 'g*', interval, p, 'b', 'linewidth', 3);
    
    % I pause at each iteration of this for loop
    pause
end