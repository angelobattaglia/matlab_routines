function s = spline_vincolata_partizione_uniforme(x,y,di,df,t)
    % di is the initial derivative,
    % df is the final derivative,
    % t è dove valutiamo la spline

    n = length(x) - 1;
    h = x(2) - x(1);  
    d = [2*h 4*h*ones(1, n-1) 2*h];

    % The Co-Diagonal Vector
    c = h*ones(1,n);
    b(1) = 6*(y(2)-y(1))/h - 6*di;                   
    b(2:n) = 6*(y(3:n+1) - y(2:n))/h - 6*(y(2:n) - y(1:n-1))/h;
    b(n+1) = 6*df - 6*(y(n+1) - y(n))/h;
    A = diag(d) + diag(c,1) + diag(c,-1); 
    M = A\b';
    i = 1;
    while t > x(i+1)
        i = i + 1;
    end
    % t belongs to this interval [x(i), x(i+1))
    s = ((x(i+1)-t)^3*M(i))+(t-x(i))^3*M(i+1)/(6*h)+... 
        ((y(i+1)-y(i))/h+h/6*(M(i)-M(i+1)))*(t-x(i))+...
        y(i)-h^2/6*M(i);
 
end
