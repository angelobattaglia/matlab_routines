
x = linpsace(0, 1, 65);
f = @(x) x.^6 + 3.^x -1;
fx = f(x);
res = 0;

for i = 1:length(x) - 1
    res = res + fx(i+1)*(x(i+1) - x(i));
end

alpha = 9/14;

err = abs()

