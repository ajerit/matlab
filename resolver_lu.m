% Algoritmo  para resolver sistemas usando LU
function [x]=resolver_lu(a,b)
    [n,m]=size(a);

    if (n == m)
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
        
        y = sust_adelante(L,b);
        x = sust_atras(U,y);
    else
        disp('El tamaño de la matriz a no coincide con el vecto b')
    end
end    