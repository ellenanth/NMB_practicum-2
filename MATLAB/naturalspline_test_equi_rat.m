N = 9;
x_l = -2;
x_r = 2;
x = linspace(x_l,x_r,N);
t = linspace(x_l,x_r,998);

f = 1./(1+7.*(x.^2));
y0 = 1./(1+7.*(t.^2));
y1 = naturalspline(x,f,t);
r1  = y1 - y0;
y2 = polyfit_eval(x,f,N-1,t);
r2 = y2 - y0;

figure();
plot(t,y0, 'b');
hold on;
plot(t,y1, 'r');
hold on;
plot(t,y2, 'g');
title('1/(1+7x²), equidistante abscissen');
legend('1/(1+7x²)', 'met splinefuncties', 'veelterminterpolatie')

figure();
% semilogy(t,zeros(1,100), 'b');
% hold on;
semilogy(t,abs(r1), 'r');
hold on;
semilogy(t,abs(r2), 'g');
title('residu, equidistante abscissen');
legend('met splinefuncties', 'veelterminterpolatie')