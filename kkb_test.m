x = [1 2 3]';
y = [1 2 3]';
F = [1 2 1;2 3 2;1 2 1];
m = 3;
n = 3;
C = kkb(x,y,F,m,n);
surf(x,y,F);
%TODO titel

F_new = zeros(3,3);
x = (1:0.1:3)';
y = (1:0.1:3)';
for i = 1:size(x,1)
    for j = 1:size(y,1)
        F_new(i,j) = kkb_evaluate(C,x(i),y(j));
    end
end
surf(x,y,F_new);
%TODO titel