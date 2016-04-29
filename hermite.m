% Adolfo Jeritson
% 12-10523

function vCoefs=hermite(xTabla,fTabla,fDerTabla)
    n = size(fTabla);
    vCoefs = zeros(1, 2*n(2));
    % Llenamos la "tabla" con valores repetidos
    for i=1:2:2*n(2)
        vCoefs(i) = fTabla(int32(i/2));
    end
    for i=2:2:2*n(2)
        vCoefs(i) = fTabla(i/2);
    end
   
    xTablaN = zeros(1, 2*n(2));
    for i=1:2:2*n(2)
        xTablaN(i) = xTabla(int32(i/2));
    end
    for i=2:2:2*n(2)
        xTablaN(i) = xTabla(i/2);
    end
   
    for j=2:2*n(2)
        for i=2*n(2):-1:j
            if (xTablaN(i) - xTablaN(i-j+1)) == 0
                % Reemplazar por el valor de la derivada
                vCoefs(i) = fDerTabla(int32(i/2));
                
            else
                vCoefs(i) = (vCoefs(i) - vCoefs(i-1)) / (xTablaN(i) - xTablaN(i-j+1));
            end
        end
    end
    
end
