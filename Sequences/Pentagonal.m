function res = Pentagonal(n)
    
res = 0;
    for i = 1:n
        res = res + 1 + 5*n*(1+n)/2 ;
    end
end
