clear;
x_i = linspace(-1,1,31);
y_i = linspace(-1,1,31);
F_i1 = sin( ((2*x_i') - 1).^2 + 2*y_i );
F_i2 = membrane(1,15);
m = 7;
n = 7;
C1 = kkb(x_i,y_i,F_i1,m,n);
C2 = kkb(x_i,y_i,F_i2,m,n);

x_s = [];
y_s = [];
for i=1:size(x_i,2)
    for j=1:size(y_i,2)
        x_s = [x_s; x_i(:,i)];
        y_s = [y_s; y_i(:,j)];
    end
end
F_s1 = F_i1(:)';
F_s2 = F_i2(:)';

x_o = linspace(-1,1,60);
y_o = linspace(-1,1,60);
F_o1 = polyval2(C1,x_o,y_o);
F_o2 = polyval2(C2,x_o,y_o);

figure
scatter3(x_s,y_s,F_s1, 10, 'filled','r');
hold on
surf(x_o,y_o,F_o1);
%title('grafiektitel')
xlabel x
ylabel y
zlabel z
set(get(gca,'ZLabel'),'Rotation',0)

figure
scatter3(x_s,y_s,F_s2, 10, 'filled','r');
hold on
surf(x_o,y_o,F_o1);
%title('grafiektitel')
xlabel x
ylabel y
zlabel z
set(get(gca,'ZLabel'),'Rotation',0)