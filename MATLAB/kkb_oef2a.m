clear;
x_i = linspace(-1,1,31);
y_i = linspace(-1,1,31);
F_i1 = sin( ((2*x_i') - 1).^2 + 2*y_i );
m = 7;
n = 7;
C1 = kkb(x_i,y_i,F_i1,m,n);

[x_s,y_s] = meshgrid(x_i,y_i);

x_o1 = linspace(-1,1,60);
y_o1 = linspace(-1,1,60);
F_o1 = polyval2(C1,x_o1,y_o1);

scatter3(x_s(:),y_s(:),F_i1(:), 10, 'filled','r');
hold on
surf(x_o1,y_o1,F_o1);
%title('grafiektitel')
xlabel x
ylabel y
zlabel z
set(get(gca,'ZLabel'),'Rotation',0)