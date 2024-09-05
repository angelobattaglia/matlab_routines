%% Chebyshev Nodes

%{
The Chebyshev nodes are important in approximation theory because 
they form a particularly good set of nodes for polynomial interpolation.
further informations: https://en.wikipedia.org/wiki/Chebyshev_nodes
%}

% Runge Function
f = @(x) 1./(1+x.^2);

% Setting up an interval could be [1, 2] or [-5, +5]
a = 1;
b = 2;
z = linspace(a,b);

% Evaluating the Runge Function in the interval [a, b]
fz = f(z);

ord = 5:5:20;

for n = 1:length(ord)

    % In the following portion of code, one can decide to use
    % either the Simple Equispaced nodes, therefore commenting the
    % vector x that follows and uncommenting the previous one

    % Simple Equispaced nodes
    % x = linspace(a, b, n+1);

    % Chebyshev nodes
    t = cos((2*(1:n+1)-1)*pi/(2*(n+1)));

    % Translating the nodes for out custom [a, b] interval
    x = (b-a)/2*t + (b+a)/2;

    % Evaluating the function in the chosen nodes
    y = f(x);

    % passing to polyfit the nodes x and the valuations y
    c = polyfit(x, y, n);
    p = polyval(c, z);

    % z, p is the polynomial
    % z, fz is the function to interpolate
    % x, y is the nodes in which the function gets interpolated
    plot(z, p, 'b', z, fz, 'r', x, y, 'ko', 'linewidth', 3)
    legend("Polynomial", "Runge Function", "Nodes")
    pause

end
