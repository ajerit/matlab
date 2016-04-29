% Algoritmo para calcular factorizacion LU
function [L,U]=fact_lu(a)
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
    else
        disp('El tamaño de la matriz a no coincide con el vecto b')
    end
end    