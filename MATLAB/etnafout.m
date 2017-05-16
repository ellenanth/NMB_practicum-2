clear;
F_i = double(imread('etna.jpg'));
x_i = linspace(-1,1, size(F_i,2));
y_i = linspace(-1,1, size(F_i,1));
m = 25;
[X,Y] = meshgrid(x_i, y_i);

C = kkb(x_i, y_i, F_i, m, m);
F_o = polyval2(C,x_i,y_i);

figure('Name', 'Etna')
subplot(2,2,1);
surf(X,Y,F_i,'EdgeColor','none','LineStyle','none','FaceLighting','phong')
xlim([-1,1]); ylim([-1,1]); zlim([0, 250]); title('Etna');

subplot(2,2,3);
imagesc(F_i); title('bovenaanzicht');

subplot(2,2,2);
surf(X,Y,F_o,'EdgeColor','none','LineStyle','none','FaceLighting','phong')
xlim([-1,1]); ylim([-1,1]); zlim([0, 250]); title('benadering Etna');

subplot(2,2,4);
imagesc(F_o); title('benadering bovenaanzicht');
