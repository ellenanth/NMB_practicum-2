clear;
x_i = [1 2 3];
F_i= [1 2 1;2 3 2;1 2 1];
m = 3;
n = 2;
C = kkb(x_i,x_i,F_i,m,n);

[x_s,y_s] = meshgrid(x_i,x_i);
x_o = linspace(1,3,30);
F_o = polyval2(C,x_o,x_o);

scatter3(x_s(:),y_s(:),F_i(:), 50, 'filled','r');
hold on
surf(x_o,x_o,F_o);
%title('grafiektitel')
xlabel x
ylabel y
zlabel z
set(get(gca,'ZLabel'),'Rotation',0)