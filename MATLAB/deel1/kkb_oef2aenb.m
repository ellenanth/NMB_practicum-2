clear;
%input
x_i = linspace(-1,1,31);
F_i1 = sin( ((2*x_i) - 1).^2 + 2*x_i' );
F_i2 = membrane(1,15);
m = 7;
n = 7;
%solve
C1 = kkb(x_i,x_i,F_i1,m,n);
C2 = kkb(x_i,x_i,F_i2,m,n);
%create mesh to plot input and output
[x_s,y_s] = meshgrid(x_i,x_i);
x_o = linspace(-1,1,60);
F_o1 = polyval2(C1,x_o,x_o);
F_o2 = polyval2(C2,x_o,x_o);

figure('Name','opgave 2')
subplot(1,2,1);
scatter3(x_s(:),y_s(:),F_i1(:), 10, 'filled','r');
hold on
surf(x_o,x_o,F_o1);
%title('oef 2a')
xlabel x
ylabel y
zlabel z
set(get(gca,'ZLabel'),'Rotation',0)

subplot(1,2,2);
scatter3(x_s(:),y_s(:),F_i2(:), 10, 'filled','r');
hold on
surf(x_o,x_o,F_o2);
%title('oef 2b')
xlabel x
ylabel y
zlabel z
set(get(gca,'ZLabel'),'Rotation',0)