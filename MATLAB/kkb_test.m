clear;
x_i = [1 2 3];
y_i = [1 2 3];
F_i= [1 2 1;2 3 2;1 2 1];
m = 3;
n = 2;
C = kkb(x_i,y_i,F_i,m,n);

x_s = [];
y_s = [];
F_s = [];
for i=1:size(x_i,2)
    for j=1:size(y_i,2)
        x_s = [x_s; x_i(:,i)];
        y_s = [y_s; y_i(:,j)];
        F_s = [F_s; F_i(i,j)];
    end
end

x_o = linspace(1,3,30);
y_o = linspace(1,3,30);
F_o = polyval2(C,x_o,y_o);

surf(x_o,y_o,F_o);
hold on
scatter3(x_s,y_s,F_s, 50, 'filled','r');
xlabel x
ylabel y
zlabel z
set(get(gca,'ZLabel'),'Rotation',0)
%TODO titel