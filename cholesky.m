% Adolfo Jeritson
% 12-10523
% Factorizacion LU Cholesky

function L=cholesky(A)
    [n,m]=size(A);
    L = zeros(n);
    
    for k=1:n
        % Sumatoria y calculo de la diagonal
        suma=0;
        for s=1:k-1
            suma = suma + (L(k,s))^2;
        end
        
        L(k,k) = sqrt(A(k,k) - suma);
        
        % Calculo de los demas elementos
        for i=k+1:n
            % Sumatoria
            suma2=0;
            for s=1:k-1
                suma2=suma2+L(k,s)*L(i,s);
            end
            
            L(i,k) = (A(k,i) - suma2) / L(k,k);
            
        end
    end
    
    if int8(L*L') == A
        disp('Se encontró la descomposición Cholesky');
    end
    
end
