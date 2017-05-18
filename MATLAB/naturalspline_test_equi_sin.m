N = 10;
x_l = -2;
x_r = 2;
x = linspace(x_l,x_r,N);
t = linspace(x_l,x_r,100);

f = sin(x);
y0 = sin(t);
y1 = naturalspline(x,f,t);
r1 = y1-y0;
y2 = polyfit_eval(x,f,N-1,t);
r2 = y2-y0;

figure();
plot(t,y0, 'b');
hold on;
plot(t,y1, 'r');
hold on;
plot(t,y2, 'g');
title('sin(x), equidistante abscissen');
legend('sin(x)', 'met splinefuncties', 'veelterminterpolatie')

figure();
plot(t,zeros(1,100), 'b');
hold on;
plot(t,r1, 'r');
hold on;
plot(t,r2, 'g');
title('residu, equidistante abscissen');
legend('sin(x)', 'met splinefuncties', 'veelterminterpolatie')