%% Absolute error (https://mathworld.wolfram.com/AbsoluteError.html)

h = 10.^(-1:-1:-15);

% Derivative of exp(x) valued in x = 1
d = (exp(1+h)-exp(1)) ./ h;

%% Comparing it to exp(1)
% loglog(X,Y) plots x and y coordinates using a base-10
% logarithmic scale on the x-axis and the y-axis
% if the values on the x-axis and y-axis are both exponential, then it'll
% be better to use this plotting method

% x-axis: h <- exponential valued-vector
% y-axis: abs(d - exp(1))
loglog(h, abs(d - exp(1)));
