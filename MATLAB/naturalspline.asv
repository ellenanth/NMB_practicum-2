function y = naturalspline(x,f,t)
% construct and evaluate a natural cubic spline
% x: abscissen, row vector of length n+1                x_i in x(1,i+1)
% f: functiewaarden, row vector of length n+1           f_i in f(1,i+1)
% t: evaluatiepunten, row vector of length N
% y: functiewaarden in de evaluatiepunten, row vector of length N
n = size(x,2)-1;
N = size(t,2);

%stelsel opstellen (HB p. 112, 5.19 en 5.20)
main_diag = zeros(1,n-1);
side_diag = zeros(1,n-1);
b = zeros(1,n-1);
for i=1:n-1
    main_diag(1,i) = 2*(x(1,i+2)-x(1,i)); % 2 * (x_i+1 - x_i-1)
    side_diag(1,i) = x(1,i+2)-x(1,i+1); % x_i+1 - x_i
    b(1,i) = (f(1,i+2)-f(1,i+1))  /   (x(1,i+2)-x(1,i+1)) ... %f_i+1 - f_i / x_i+1 - x_i
            - (f(1,i+1)-f(1,i))   /   (x(1,i+1)-x(1,i));      %f_i - f_i-1 / x_i - x_i-1
end
b = 6.*b;
A = diag(main_diag, 0) + diag(side_diag(1:n-2), -1) + diag(side_diag(1:n-2), 1);
%stelsel oplossen, S is een kolomvector met s"(x_1) tem s"(x_n-1)
S = A\(b');

%constantes c1i en c2i berekenen en bewaren in een rijvector
c_1 = zeros(1,n);
c_2 = zeros(1,n);
for j=1:n
    if (j==1) % s"(x_0) = 0
        c_1(1,j) = f(1,j+1)/(x(1,j+1)- x(1,j)) - (x(1,j+1)-x(1,j))/6*S(j,1);
        c_2(1,j) = f(1,j)/(x(1,j+1)-x(1,j));
    elseif (j==n) % s"(x_n)=0
        c_1(1,j) = f(1,j+1)   /   (x(1,j+1)-x(1,j));
        c_2(1,j) = f(1,j)/(x(1,j+1)-x(1,j)) - (x(1,j+1)-x(1,j))/6*S(j-1,1);
    else
        c_1(1,j) = f(1,j+1)/(x(1,j+1)- x(1,j)) - (x(1,j+1)-x(1,j))/6*S(j,1);
        c_2(1,j) = f(1,j)/(x(1,j+1)-x(1,j)) - (x(1,j+1)-x(1,j))/6*S(j-1,1);
    end
end

%y bepalen
y = zeros(1,N);
for k=1:N
    %bepalen tussen welke x-waarden de huidge t-waarde ligt
    l=0;
    if (t(1,k)>x(1,n+1))
        l = n+1;
    else
        while(t(1,k)>x(1,l+1))
        l = l+1;
        end
    end
    
    %y_t berekenen (HB p. 111, 5.13)
    if (l==0) % t ligt links van de eerste abscis, gebruik eerste functiewaarde
        y(1,k) = f(1,1);
    elseif (l==n+1) % t ligt rechts van de laatste abscis, gebruik laatste functiewaarde
        y(1,k) = f(1,n+1);
    elseif (t(1,k)==x(1,l+1)) % t ligt juist op een abscis
        y(1,k) = f(1,l+1);
    elseif (l==1) % t ligt in eerste interval, s"(x_0) = 0
        y(1,k) = (t(1,k) - x(1,l))^3  / (6*(x(1,l+1)-x(1,l))) * S(l,1) ...
         + c_1(1,l) * (t(1,k) - x(1,l)) ...
         + c_2(1,l) * (x(1,l+1) - t(1,k));
    elseif (l==n) % t ligt in laatste interval, s"(x_n) = 0
        y(1,k) = - (t(1,k) - x(1,l+1))^3    / (6*(x(1,l+1)-x(1,l))) * S(l-1,1) ...
         + c_1(1,l) * (t(1,k) - x(1,l)) ...
         + c_2(1,l) * (x(1,l+1) - t(1,k));
    else
        y(1,k) = (t(1,k) - x(1,l))^3  / (6*(x(1,l+1)-x(1,l))) * S(l,1) ...
         - (t(1,k) - x(1,l+1))^3    / (6*(x(1,l+1)-x(1,l))) * S(l-1,1) ...
         + c_1(1,l) * (t(1,k) - x(1,l)) ...
         + c_2(1,l) * (x(1,l+1) - t(1,k));
    end
end
end