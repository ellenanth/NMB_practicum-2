clear;
x_i = linspace(-1,1,31);
y_i = linspace(-1,1,31);
F_i2 = membrane(1,15);
m = 7;
n = 7;
C1 = kkb(x_i,y_i,F_i2,m,n);

[x_s,y_s] = meshgrid(x_i,y_i);

x_o2 = linspace(-1,1,60);
y_o2 = linspace(-1,1,60);
F_o2 = polyval2(C1,x_o2,y_o2);

scatter3(x_s(:),y_s(:),F_i2(:), 10, 'filled','r');
hold on
surf(x_o2,y_o2,F_o2);
%title('grafiektitel')
xlabel x
ylabel y
zlabel z
set(get(gca,'ZLabel'),'Rotation',0)