%% Constraint Cubic Spline 

n = 25;
x = linspace(0,1,n);    % Nodes to interpolate
z = linspace(0,1,1000); % Domain of the spline

% Declaring f and its derivative fd

f = @(x) (x.^3).*(cos(x));
fd = @(x) 3.*(x.^2).*cos(x)-(x.^3).*sin(x);

% Functions valued in the nodes x

f1 = f(x);
fd = fd(x);

% Function valued in the domain z

f1_domain = f(z);
fd_domain = fd(z);

% Derivate nei punti 0 e 1

yd0 = fd(0);
yd1 = fd(1);

% Per trovare il massimo errore assoluto di interpolazione 

s = spline(x, [yd0 f1 yd1], z);

% s = spline(x, [yd0 f1 yd1], z);
% for i = 1:1000
%   err = abs(f1vera(i) - s(i));
% end
% m=max(err);
err = norm(f1_domain - s, inf);
