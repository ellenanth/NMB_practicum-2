N = 9; %aantal abscissen

x = zeros(1,N);
for i=0:N-1
   x(i+1) = -2*cos((2*i+1)/(2*N)*pi); 
end
x_l = x(1,1);
x_r = x(1,N);
t = linspace(x_l,x_r,100);

f = 1./(1+7.*(x.^2));
y0 = 1./(1+7.*(t.^2));
y1 = naturalspline(x,f,t);
r1 = y1 - y0;
y2 = polyfit_eval(x,f,N-1,t);
r2 = y2 - y0;

figure();
plot(t,y0, 'b');
hold on;
plot(t,y1, 'r');
hold on;
plot(t,y2, 'g');
title('1/(1+7x²), chebyshev-punten');
legend('1/(1+7x²)', 'met splinefuncties', 'veelterminterpolatie')

figure();
plot(t,zeros(1,100), 'b');
hold on;
plot(t,r1, 'r');
hold on;
plot(t,r2, 'g');
title('residu, chebyshev-punten');
legend('1/(1+7x²)', 'met splinefuncties', 'veelterminterpolatie')