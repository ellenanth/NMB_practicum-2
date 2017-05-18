function y = polyfit_eval(x,f,n,t)
p = polyfit(x,f,n);
y = zeros(1,size(t,2));
for i=1:size(t,2)
    for j=n:-1:0
        y(1,i) = y(1,i) + p(1,n-j+1)*t(1,i)^j;
    end
end
end