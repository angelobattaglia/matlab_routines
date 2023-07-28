%% Drawing two functions in the same window

x=linspace(-pi, +pi, 100);
y1_1=sin(x);
y1_2=cos(x-1); 

% The command figure opens a window on which the followind command will
% write on ..
figure(1)

%{ 
    The X,Y pairs, or X,Y,S triples, can be followed by 
    parameter/value pairs to specify additional properties 
    of the lines. For example, plot(X,Y,'LineWidth',2,'Color',[.6 0 0]) 
    will create a plot with a dark red line width of 2 points.
%}

% We draw on it with the command plot
plot(x,y1_1,'r',x,y1_2,'b','LineWidth',2);

%% Drawing other functions..

x2 = linspace(0.1, 100, 1000);
% use .* and .^ for every operation involving a vector
y2_1 = sqrt((100*(1-0.01.*x2.^2).^2)/(1-x2.^2).^2+0.1.*x2.^2);

figure(2)
loglog(x2, y2_1, 'o', 'LineWidth', 1);

%% Functions defined using intervals

% let's define the four points first

a = -2;
b = 0;
c = 2*pi;
d = 8;
x = linspace(a,d,1000);
% It's possible to fill f with a cycle:
% f= zeros(size(x));
% for i = 1:length(x)
%     if x(i)>=a && x(i)<b
%         f(i) = exp(-x(i)^2);
%     else
%         if x(i)>=b && x(i)<c
%             f(i) = cos(8*x(i));
%         else
%             if x(i)>=c && x(i)<=d
%                 f(i) = 1;
%             end
%         end
%     end
% end
% .. or by using logical syntax:
figure(3);
f4 = (x>=a & x< b).*(exp(-x.^2)) + ...
    (x>=b & x<c).*(cos(8*x)) + ...
    (x>=c & x<d).*(ones(size(x)));
plot(x, f4);

%% Using the logarithmic scale for just one axis
x = linspace(1e-10, 2, 1000);
f5 = x.*sin(1./x);
figure(4);
semilogx(x, f5);
