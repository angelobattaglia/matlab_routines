%% Plotting an exagon

t = 0:pi/3:2*pi;
x = cos(t);
y = sin(t);
plot(x,y,'-b','linewidth',3);
axis square
hold on 
y=-0.866;
line([-1,1],[y,y])
hold on
j=-0.5;
k=-0.866;
o=0.5;
p=-0.866;
plot(j,k,'or',o,p,'or','LineWidth',3);
