[x,y] = click;
n = size(x,2);
t = zeros(1,n);
t(1,1) = 0;
for i=2:n
    t(1,i) = t(1,i-1) + sqrt( (y(1,i)-y(1,i-1))^2 + (x(1,i)-x(1,i-1))^2 );
end
t_range = linspace(min(t), max(t), 300);
x_spline = naturalspline(t,x, t_range);
y_spline = naturalspline(t,y, t_range);
figure()
scatter(x,y);
hold on;
plot(x_spline,y_spline);