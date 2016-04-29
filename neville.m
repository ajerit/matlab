% Adolfo Jeritson
% 12-10523
% Función para calcular el polinomio de Lagrange
% Entradas:   xEval = Valor de X a evaluar en el polinomio Lagrange
%             xTabla = Vector tamaño n con los valores de X
%             yTabla = Vector tamaño n con los valores de Y (o f(X))
% Salida:     p = Resultado de evaluar el polinomio de Lagrange en el punto
%                 xEval

function p=neville(xEval, xTabla, yTabla)
    xSize = size(xTabla);
    ySize = size(yTabla);
    
    if xSize(1) ~= ySize(1)
        disp('La tabla de X debe tener tantos datos como Y')
    else
        Q = zeros(xSize(1));
        for s=1:xSize(1)
            Q(s,1) = yTabla(s);
        end
        
        for i=2:xSize(1)
            for j=2:i
                Q(i,j) = ((xEval - xTabla(i-j+1))*Q(i,j-1) - (xEval - xTabla(i))*Q(i-1,j-1)) / (xTabla(i) - xTabla(i-j+1));
            end
        end
        
        p = Q(xSize(1),xSize(1));
    end
end
