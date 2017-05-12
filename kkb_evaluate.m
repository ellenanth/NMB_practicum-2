function f_ij = kkb_evaluate(C,x_i,y_j)
[m,n] = size(C);
f_ij=0;
for k=0:m-1
    for l=0:n-1
        f_ij = f_ij + C(k+1,l+1)*x_i^k*y_j^l;
    end
end
end