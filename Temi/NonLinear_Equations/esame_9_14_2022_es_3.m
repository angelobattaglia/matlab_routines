% Implementation and example of the Newton-Rhapson algorithm

% I set the format of the output
format short e

% first I write the equation in its canonical form i.e. f(x) = 0
f = @(x) x - cos(x./2) - 2;

% then I write its derivative
fd = @(x) 1 + sin(x/2).*0.5;

% the starting point
x0 = 5;

% the exact value
exact_value = 2.374302876933534e+00;

% Newton-Rhapson method
for n = 1:3
    x = x0 - f(x0)/fd(x0);
    x0 = x;
end

% Then I compute the relative error
relative_error = abs(x0 - exact_value)/abs(exact_value)
