function [a,b]=gauss_arriba(a, b)
    [n, m] = size(a);
    l = length(b);
    
    if (n == m && n == l)
        for k=n:-1:2
            for i=k-1:-1:1
                alfa = a(i,k)/a(k,k);
                for j=k:-1:1
                    a(i,j) = a(i,j) - alfa*(a(k,j));
                end
                b(i) = b(i) - alfa*(b(k));
            end
        end    
    else
        disp('Error, la matriz no es cuadrada o no coincide con el vecto b')
    end
        
end
