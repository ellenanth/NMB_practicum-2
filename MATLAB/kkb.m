function C = kkb(x,y,F,m,n)
%construct A and B
A = zeros(size(x,2),m+1);
B = zeros(size(y,2),n+1);
for k = 0:m
    A(:,k+1) = x'.^k;
end
for l = 0:n
    B(:,l+1) = y'.^l;
end
%calculate C
C = B\F * pinv(A)';
end