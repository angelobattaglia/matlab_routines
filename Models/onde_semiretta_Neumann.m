close all
xmax=20;
dx=1e-2;
T=1;
dt=1e-2;
c=1e1;

x=0:dx:xmax;
t=0:dt:T;

u0=@(x) sin(x).*(x>=2*pi).*(x<=3*pi);

figure('Name','Equazione delle onde con condizione di Neumann omogenea','NumberTitle','Off')
for i=1:length(t)
    u=0.5*(u0(x-c*t(i))+u0(x+c*t(i))).*(x>=c*t(i))+0.5*(u0(x+c*t(i))+u0(c*t(i)-x)).*(x<c*t(i));
    plot(x,u,'LineWidth',2);
    title(sprintf('$t=%.2f$',t(i)))
    axis([0 xmax -0.6 1])
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
end