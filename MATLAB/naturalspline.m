function y = naturalspline(x,f,t)
% construct and evaluate a natural cubic spline
% x: abscissen, vector of length n+1
% f: functiewaarden, vector of length n+1
% t: evaluatiepunten, vector of length N
% y: functiewaarden in de evaluatiepunten, vector of length N
n = size(x,1)-1;

%stelsel opstellen (HB p. 112)
main_diag = zeros(n-1);
side_diag = zeros(n-1);
b = zeros(n-1);
for i=1:n-1
    main_diag(i) = 2*(x(i+1)-x(i-1));
    side_diag(i) = x(i+1)-x(i);
    b(i) = (f(i+1)-f(i))/(x(i+1)-x(i)) - (f(i)-f(i-1))/(x(i)-x(i-1));
end
b = 6.*b;
A = diag(main_diag, 0) + diag(side_diag(1:n-2), -1) + diag(side_diag(1:n-2), 1);

%stelsel oplossen
S = A\b;

%constantes c1i en c2i berekenen
%TODO

%y bepalen

%TODO voor elke t bepalen tussen welke x-waarden hij ligt, waarde van p_i
%berekenen (HB p. 111)

end