clear;
x_i1 = linspace(-1,1,30);
x_i2 = [linspace(-1,-0.20,5) linspace(-0.18,0.18,20) linspace(0.20,1,5)];
F_i1 = (1 + 25*((x_i1').^2 + x_i1.^2)).^(-1);
F_i2 = (1 + 25*((x_i2').^2 + x_i2.^2)).^(-1);
mn_min = 1;
mn_max = 10;

r1 = [];
r2 = [];
r1m = [];
r2m = [];
for m = mn_min:mn_max
    C1 = kkb(x_i1,x_i1,F_i1,m,m);
    C2 = kkb(x_i2,x_i2,F_i2,m,m);
    Z_mn1 = polyval2(C1, x_i1, x_i1);
    Z_mn2 = polyval2(C2, x_i2, x_i2);
    R1 = (F_i1 - Z_mn1).^2;
    R2 = (F_i2 - Z_mn2).^2;
    r1 = [r1 sum(R1(:))];
    r2 = [r2 sum(R2(:))];
    
    R1m = (F_i1 - Z_mn1);
    R2m = (F_i2 - Z_mn2);
    r1m = [r1m max(abs(R1m(:)'))];
    r2m = [r2m max(abs(R2m(:)'))];
end

figure('Name', 'opgave 4: benaderingsfout')
semilogy(mn_min:mn_max, r1,'r.-');
hold on
semilogy(mn_min:mn_max, r2,'b.-');
legend('equidistant','niet equidistant');

figure('Name', 'opgave 4: maximale afwijking')
semilogy(mn_min:mn_max, r1m,'r.-');
hold on
semilogy(mn_min:mn_max, r2m,'b.-');
legend('equidistant','niet equidistant');
