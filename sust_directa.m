function x=sust_directa(a,b)
%La matriz debe ser una matriz diagonal
[n,m] = size(a);
x = zeros(1,n);
for k=1:n
    x(k)= b(k)/a(k,k);
end
end