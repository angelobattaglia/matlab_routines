function I = Trapezi_Compositi()
    % Define the function to integrate
    f = @(x) log(x) + x;

    % Define the limits of integration
    a = 8;
    b = 9;

    % Number of intervals
    N = 72;

    % Calculate the width of each interval
    h = (b - a) / N;

    % Calculate the x values
    x = a:h:b;

    % Calculate the y values
    y = f(x);

    % Apply the composite trapezoidal rule
    I = (h/2) * (y(1) + 2*sum(y(2:end-1)) + y(end));
end