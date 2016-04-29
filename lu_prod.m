% Adolfo Jeritson
% 12-10523
% Factorizaci�n LU por productos

function [L,U]=lu_prod(A)
    [n,m]=size(A);
    L=eye(n);
    U=zeros(n);
    
    for k=1:n
        % Sumatoria
        suma=0;
        for s=1:k-1
            suma = suma + L(k,s)*U(s,k);
        end
        % Fijada la diagonal de L, calculamos la de U
        U(k,k) = (A(k,k) - suma) / L(k,k);
        
        % Calculo de los elementos de U
        for j=k+1:n
            % Sumatoria
            suma2=0;
            for s=1:k-1
                suma2 = suma2 + L(k,s)*U(s,j);
            end
            
            U(k,j) = (A(k,j) - suma2) / L(k,k);
        end
        
        % Calculo de los elementos de L
        for i=k+1:n
            % Sumatoria
            suma3=0;
            for s=1:k-1
                suma3 = suma3 + L(i,s)*U(s,k);
            end
            
            L(i,k) = (A(i,k) - suma3) / U(k,k);
        end
    end
end


