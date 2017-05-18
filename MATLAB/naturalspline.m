function y = naturalspline(x,f,t)
% construct and evaluate a natural cubic spline
% x: abscissen, row vector of length n+1                x_i in x(i+1)
% f: functiewaarden, row vector of length n+1           f_i in f(i+1)
% t: evaluatiepunten, row vector of length N            t_i in t(i+1)
% y: functiewaarden in de evaluatiepunten, row vector of length N
n = size(x,2)-1;
N = size(t,2);

%TODO indices fixen

%stelsel opstellen (HB p. 112)
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
A1 = diag(main_diag, 0);
A2 = diag(side_diag(1:n-2), -1);
A3 = diag(side_diag(1:n-2), 1);
A = A1 + A2 + A3;
%stelsel oplossen, S is een vector met s_1 tem s_n-1
S = A\(b');
%constantes c1i en c2i berekenen
% c1i is te vinden in c_1(i+1)
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
    %bepalen tussen welke x-waarden de t ligt
    l=0;
    if (t(1,k)>x(1,n+1))
        l = n+1;
    else
        while(t(1,k)>x(1,l+1))
        l = l+1;
        end
    end
    
    %y_t berekenen (HB p. 111, 5.13)
    if (l==0)
        y(1,k) = f(1,1);
    elseif (l==n+1)
        y(1,k) = f(1,n+1);
    elseif (t(1,k)==x(1,l+1))
        y(1,k) = f(1,l+1);
    elseif (l==1) %s"(x_0) = 0
        y(1,k) = (t(1,k) - x(1,l))^3  / (6*(x(1,l+1)-x(1,l))) * S(l,1) ...
         + c_1(1,l) * (t(1,k) - x(1,l)) ...
         + c_2(1,l) * (x(1,l+1) - t(1,k));
    elseif (l==n) %s"(x_n) = 0
        %TODO deze formule mist een constante term
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