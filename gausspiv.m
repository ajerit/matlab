% Algoritmo  de eliminacion gaussiana con pivoteo
function [a,b]=gausspiv(a, b)
    [n,m]=size(a);
    l = length(b);
    
    if (n == m && n == l)
        for k=1:n-1
            imax = k;
            % Buscamos el elemento de mayor magnitud en la columna
            for i=k+1:n
                if (abs(a(i,k)) > abs(a(imax,k)))
                    imax = i;
                end
            end

            % Intercambiamos la fila del mayor encontrado antes
            for j=k:n
                temp = a(imax,j); 
                a(imax,j) = a(k,j); 
                a(k,j) = temp;
            end

            % Intercambio de las filas k e imax del vector b
            temp = b(imax);
            b(imax) = b(k);
            b(k) = temp;

            % Eliminacion gaussiana
            for i=k+1:n
                alfa = a(i,k)/a(k,k);
                for j=k:n
                    a(i,j) = a(i,j) - alfa*(a(k,j));
                end
                b(i) = b(i) - alfa*(b(k));
            end
        end
    else
        disp('El tamaño de la matriz a no coincide con el vecto b')
    end
end    