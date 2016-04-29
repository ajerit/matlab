% Laboratorio 3
% Adolfo Jeritson
% 12-10523

function [L,U]=lu_lab(A)
[m,n]=size(A);
U=A;
L=eye(n);
for k=1:m-1
    for j=k+1:m
        L(j,k) = U(j,k)/U(k,k);
        U(j,k:m) = U(j,k:m) - L(j,k)*U(k,k:m);
        
    end
end
end