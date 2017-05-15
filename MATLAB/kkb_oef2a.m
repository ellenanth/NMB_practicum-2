x = linspace(-1,1,31);
y = linspace(-1,1,31);
m = 7;
n = 7;

F1 = sin( ((2*x') - 1).^2 + 2*y );
C1 = kkb(x,y',F1,m,n);
X1 = linspace(-1,1,60);
Y1 = linspace(-1,1,60);
Z1 = polyval2(C1,X1,Y1);
%surf(x,y,F1);
Xs = [];
Ys = [];
Zs = [];
for k=1:size(x,1);
    for l=1:size(y,2);
        Xs = [Xs; x(k)];
        Ys = [Ys; y(l)];
        Zs = [Zs; F1(k,l)];
    end
end
scatter3(Xs,Ys,Zs);
%TODO bolletjes kleiner maken
surf(X1,Y1,Z1);
%TODO 1 prentje
%TODO accentjes opkuisen