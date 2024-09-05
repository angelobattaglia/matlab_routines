close all
clear all
clc

xmax=10;
dx=1e-1;
D=2;
T=2;
N=1e3;
dt=dx^2/(2*D);

t=0:dt:T;
X=zeros(1,N);
x=-xmax:dx:xmax;

u=@(x,t) 1/sqrt(4*pi*D*t)*exp(-x.^2/(4*D*t));

figure('Name','Equazione del calore','NumberTitle','Off')
for i=1:length(t)
    plot(X,zeros(1,N),'o','MarkerEdgeColor','red','MarkerSize',3);
    hold on
    plot(x,u(x,t(i)),'Color',[0.0745 0.6235 1],'LineWidth',2);
    title(sprintf('$t=%.2f$',t(i)))
    axis([-xmax xmax -0.1 1])
    xlabel('$x$')
    ylabel('$u(x,t)$')
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
    M=2*binornd(1,0.5*ones(1,N))-1;
    X=X+M*dx;
end