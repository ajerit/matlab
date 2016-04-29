% Adolfo Jeritson
% 12-10523
% Funcion para calcular los coeficientes del polinomio canonico y su
% evaluacion
% Entradas:   xTabla = Vector tamaño n con valores de X
%             yTabla = Vector tamaño n con valores de Y (o f(X))
% Salida:     pCoef = Vector con los coeficientes del polinomio canonico,
%                     ordendados desde la mayor potencia hasta la menor
%             pEval = Vector con el resultado de evaluar el polinomio
%                     canonico con los coeficientes calculados, usando el
%                     metodo de Horner.
function [pCoef,pEval]=canonico(xTabla,yTabla)
    xSize = size(xTabla);
    ySize = size(yTabla);
    
    if xSize(1) ~= ySize(1)
        disp('X debe tener tantos valores como Y')
    else
        % Construyo matriz de Vandermonde
        mVan = zeros(xSize(1));
        mVan(:,1) = 1;
        for s=1:xSize(1)
            mVan(:,s) = xTabla.^(s-1);
        end
        
        % Resuelvo el sistema mVan*pCoef = yTabla
        pCoef = lu_prod(mVan,yTabla');
        % Se invierten para que que esten desde la mayor potencia a la
        % menor
        %pCoef = fliplr(pCoef);
        
        % Con los coeficientes construyo y evaluo polinomio
        pEval = horner_nat(pCoef,xTabla);
    end
end