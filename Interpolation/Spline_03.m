%% Computing a cubic Spline "not-a-knot" with different degrees

% Represent the cubic spline that satisfies the not-a-knot condition and
% interpolating the function f(x) = 1/(1+x^2) in I=[-5,5], of degree 
% 6,10,14

a = -5;
b = 5;
f = @(x) 1./(1+x.^2);
z = linspace(a, b);

% fz is the non-polynomial real function computed over the interval,
% then I divide the interval into nodes and compare the two 
% with the infinity norm

fz = f(z);

% Equally spaced knots which vary depending on whether you 
% want 6 10 14 knots
% I create the vector y that uses the function that I had pre-set 
% to calculate
% cubic spline not a knot calculated in the z interval and interpolating
% the data contained in the x and y vectors

for n=6:4:14
    x = linspace(a,b,n); 
    y = f(x);            
    s = spline(x,y,z);    
    
    % Plotting and evaluating the error
    plot(x,y,'ko', z,s,'b', z,fz,'r','linewidth',3);
    err = norm(s - fz, inf);
    pause
end
