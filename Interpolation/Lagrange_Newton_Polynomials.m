%% Monomial, Lagrange and Newton representation

x = [0 1 2 1/2];
y = [1 -1 1 2];
z = linspace(0,2,100);

% Monomial Representation
c = polyfit(x,y,3);
p1 = polyval(c,z);

% Lagrange interpolating polynomial (representation)
elle1 = ((z-1).*(z-2).*(z-1/2))/((0-1)*(0-2)*(0-1/2));
elle2 = ((z-0).*(z-2).*(z-1/2))/((1-0)*(1-2)*(1-1/2));
elle3 = ((z-0).*(z-1).*(z-1/2))/((2-0)*(2-1)*(2-1/2));
elle4 = ((z-0).*(z-1).*(z-2))/((1/2-0)*(1/2-1)*(1/2-2));
p2 = elle1 - elle2 + elle3 + 2*elle4;

% Newton interpolating polynomial (representation)
p3 = 1-2*(z-0)+2*(z-0).*(z-1)+20/3*(z-0).*(z-1).*(z-2);

% Plotting all of the three interpolating polynomials
plot(z,p1,'r-', z,p2,'b-', z,p3,'g','linewidth',3)
legend('monomiale','Lagrange','Newton0')
hold on
plot(x,y,'ko')

% Errors
err1 = max(abs(p3-p1));
err2 = max(abs(p3-p2));
