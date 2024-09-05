clear all
clc
close all
xmax=10;
dx=1e-1;
D=2;
T=2;
N=1e3;
dt=dx^2/(2*D);

t=1e-3:dt:T;
X=zeros(1,N);
Y=X;
x=-xmax:dx:xmax;
y=x;
[x,y]=meshgrid(x,y);

u=@(x,y,t) 1/(4*pi*D*t)*exp(-(x.^2+y.^2)/(4*D*t));

figure('Name','Equazione del calore in 2D','NumberTitle','Off')
for i=1:length(t)
    plot(X,Y,'o','MarkerEdgeColor','red','MarkerSize',3);
    hold on
    uu=u(x,y,t(i));
    contour(x,y,uu,'LineWidth',2);
    contour(x,y,uu,[1e-4 1e-3 1e-2],'LineWidth',2);
    colormap(jet)
    colorbar('TickLabelInterpreter','latex')
    title(sprintf('$t=%.2f$',t(i)))
    axis([-xmax xmax -xmax xmax])
    axis square
    xlabel('$x$')
    ylabel('$y$')
    set(0,'DefaultTextInterpreter','latex')
    set(gca,'TickLabelInterpreter','latex')
    set(0,'DefaultAxesFontSize',18)
    grid on
    if i==1
        pause
    else
        pause(0.1)
    end
    hold off
    Mx=2*binornd(1,0.5*ones(1,N))-1;
    My=2*binornd(1,0.5*ones(1,N))-1;
    X=X+Mx*dx;
    Y=Y+My*dx;
end