%% Esercitazione due: esercizio 2

% Approximate the functions with interpolating polynomials of degree 
% n = 5, 10, 15 f1(x) = sin(x) in the interval [0, pi], and 
% f2(x) = 1/(1 + x^2) in the range [-2pi, 2pi]. Use both equally 
% spaced knots and Chebyshev-Lobatto knots appropriately transformed 
% into the range of interest

a = 0;
b = pi;
f = @(x) sin(x);
z = linspace(a,b);
% Evaluating the actual function to approximate
fz = f(z);

% We repeat this experiment given a 5 degree polynomial and then 10, 15
for n = 5:5:15
    
    % Equally Spaced Nodes n+1, where n is the deg(p(x))
    x = linspace(a,b,n+1);
    % Evaluating y in these points
    y = f(x);
    c1 = polyfit(x,y,n);
    p1 = polyval(c1,z);
    % Comparing the approximation made with the
    % equally spaced nodes to the actual function "fz"
    err1 = norm(p1 - fz,inf);
    err1_100 = abs(p1-fz);
    
    % Chebyshev-Lobatto nodes are in the t vector, x vector is the 
    % knots but translated
    t = -cos(((1:n+1)-1)*pi/n);
    x = (b-a)/2*t+(b+a)/2;
    % Evaluating y in these points
    y = f(x);
    % Fitting the points with polyfit
    c2 = polyfit(x,y,n);
    % Computing the values of the polynomial in the interval z
    p2 = polyval(c2,z);

    % Comparing the approximation made with the
    % Chebyshev-Lobatto nodes to the actual function "fz"
    err2 = norm(p2-fz,inf);
    err2_100 = abs(p2-fz);

    % Plotting both the function, the nodes and the polynomials approx.
    figure(1)
    plot(z, p1, 'b', z, p2, 'r', z, fz, 'g', x, y, 'ko', 'linewidth', 3)
    legend('equispaziati','Chebyshev-Lobatto','sin(x)','dati_interp')
    
    % Plotting the error function
    figure(2)
    plot(z, err1_100, 'b', z, err2_100, 'r', 'linewidth', 3)
    legend('equispaziati','Chebyshev-Lobatto')
    pause
end