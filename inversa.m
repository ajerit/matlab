% Laboratorio 3
% Adolfo Jeritson
% 12-10523

% Calculo de la funcion inversa usando LU
function [k]=inversa(a)
[n,m]=size(a);

for k=2:n
    % Eliminacion gaussiana para LU
    for i=k:n
        a(i,k-1) = a(i,k-1)/a(k-1,k-1);
        for j=k:n
            a(i,j) = a(i,j) - a(i,k-1)*(a(k-1,j));
        end
    end
end
L = tril(a, -1) + eye(n);
U = triu(a, 0);
k = zeros(n);

for i=1:n
    b=zeros(n,1);
    b(i)=1;
    
    d=sust_adelante(L,b);
    x=sust_atras(U,d);
    
    for j=1:n
        k(j,i) = x(j);
    end
end
end
