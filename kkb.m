function C = kkb(x,y,F,m,n)
% Benader een oppervlak op basis van de functiewaarden F op een rechthoekig
% puntenrooster (x_i, y_i) met als benaderende functie een bivariate
% veelterm van graad m in x en graad n in y.
% x: vector met M waarden, interpolatiepunten op x-as
% y: vector met N waarden
% F: matrix met functiewaarden
% m: graad in x van benaderende functie
% n: graad in y van benaderende functie

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