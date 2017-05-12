function C = kkb(x,y,F,m,n)
[M,~] = size(x);
[N,~] = size(y);

%construct A and B
A = zeros(M,m+1);
B = zeros(N,n+1);
for k = 0:m
    A(1:M, k+1) = x.^k;
end
for l = 0:n
    B(:,l+1) = y.^l;
end

%calculate C
temp1 = B\F;
temp2 = pinv(A)';
C = temp1 * temp2;
end