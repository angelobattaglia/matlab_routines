%% Interpolating with polyfit

% Given a set of datas in (x, y), let's fit them with polyfit

x = [3 6 7 14 21];
y = [8 4 5 5 7];
c = polyfit(x,y,4);

% Evaluating the polynomial interpolating x and y in the point exp(0.7)

p = polyval(c, exp(0.7));

% Interpolating 4 coordinates (X,Y)

x = [0 1 2 1/2];
y = [1 -1 1 2]; 
c=polyfit(x,y,length(x)-1);
z=linspace(min(x),max(x));
p1 = polyval(c,z);
plot(x,y,'ro',z,p,'b');

% Interpolating a function

f = @(x) cos(1./x);
x_nodi = linspace(0.2,1,3);
y_nodi = f(x_nodi);
z = f(0.8);
c2 = polyfit(x_nodi,y_nodi,2);
p2 = polyval(c_2,0.8);
risultato=abs(z-p_2);

% Using polyfit and polyval to interpolate

n=7;
%nodes
x=linspace(-1,1,n); 
x1=linspace(-1,1);
f= @(x) exp(x)./((x.^2)+1); %funzione
y=f(x);
y1=f(x1);
c=polyfit(x,y,n-1); 
p=polyval(c,x);
p3=polyval(c,x1);
err=norm(y1-p1,inf);

% Chebyshev Interpolation

% equispaced nodes
x=linspace(0,1,8); 
% Declare anonymous function
f= @(x) atan(x.*(x+1)); 
% Evaluate the anonymous function
y=f(x); 
% Evaluating in 0.5 e 0.7
y1=f(0.5);
y2=f(0.7);
% Evaluating the Polynomial that interpolates the function
c=polyfit(x,y,7);
p1=polyval(c,0.5);
p4=polyval(c,0.7);
err1=abs(y1-p1);
err2=abs(y2-p2);
