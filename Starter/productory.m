function m = productory(n)

res = 1;
for i=1:n
    res = res * i^((-1)^(i+1));
end

m = res;

end