% Adolfo Jeritson. 12-10523
% Algoritmo SOR para aproximar soluciones de sistemas lineales
% Entrada: A = Matriz nxn
%          B = Vector nx1
%          w = Factor positivo para SOR
%          N = Numero maximo de iteraciones
%          e = Epsilon para precision de la respuesta
% Salida:  x = Vector nx1, respuesta aproximada
function x=sor2(A,B,w,N,e)
    %t=cputime;
    [n,m]=size(A);
    % Iniciales
    x = zeros(n,1);

    % Calculamos D,E,F
    D = sparse(diag(diag(A)));
    E = sparse(tril(A,-1))*-1;
    F = sparse(triu(A,1))*-1;
    
    size(F)
    size(B)
    size(D)
    for k=1:N
        y = (D - w*E)\((w*F + (1-w)*D)*x + w*B);
       %y = inv(D - w*E)*((w*F + (1-w)*D)*x + w*B);
        if norm(y - x, 'inf') < e
            break
        end
        x = y;
    end
    %total = cputime-t    
    %whos
end
