function [a,b]=gaussnopiv(a, b)
    [n, m] = size(a);
    l = length(b);
    
    if (n == m && n == l)
        for k=1:n-1
            for i=k+1:n
                alfa = a(i,k)/a(k,k);
                for j=k:n
                    a(i,j) = a(i,j) - alfa*(a(k,j));
                end
                b(i) = b(i) - alfa*(b(k));
            end
        end    
    else
        disp('Error, la matriz no es cuadrada o no coincide con el vecto b')
    end
        
end
