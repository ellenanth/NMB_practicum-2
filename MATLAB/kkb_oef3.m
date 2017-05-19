clear;
%input
x_i = linspace(-1,1,31);
F_i1 = sin( ((2*x_i) - 1).^2 + 2*x_i' );
F_i2 = membrane(1,15);
mn_min = 1;
mn_max = 20;
%solve and calculate error
r1 = [];
r2 = [];
for m = mn_min:mn_max
    C1 = kkb(x_i,x_i,F_i1,m,m);
    C2 = kkb(x_i,x_i,F_i2,m,m);
    Z_mn1 = polyval2(C1, x_i, x_i);
    Z_mn2 = polyval2(C2, x_i, x_i);
    R1 = (F_i1 - Z_mn1).^2;
    R2 = (F_i2 - Z_mn2).^2;
    r1 = [r1 sum(R1(:))];
    r2 = [r2 sum(R2(:))];
end

figure('Name', 'opgave 3')
semilogy(mn_min:mn_max, r1,'r.-');
hold on
semilogy(mn_min:mn_max, r2,'b.-');
%title('oef 3')
legend('f(x,y) = sin((2x-1)^2+2y)','F = membrane(1,15)')
xlabel 'm,n'
ylabel benaderingsfout
