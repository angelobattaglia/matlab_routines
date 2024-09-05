% Computing Divided differences
function a = diffdiv(x, y, n)

a = y;

for i = 1:n
    for j = n+1:-1:i+1
        a(j) = (a(j) - a(j-1))/(x(j) - x(j-i));
    end 
end