function C = kkb(x,y,F,m,n)
% Benader een oppervlak op basis van de functiewaarden F op een rechthoekig
% puntenrooster (x_i, y_i) met als benaderende functie een bivariate
% veelterm van graad m in x en graad n in y.
% x: vector met M waarden, interpolatiepunten op x-as
% y: vector met N waarden
% F: matrix met functiewaarden
% m: graad in x van benaderende functie
% n: graad in y van benaderende functie

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