% Adolfo Jeritson. 12-10523
% Funcion para calcular los coeficientes usando el metodo de Diferencias
% Divididas para el polinomio de Newton
% Entrada:   xTabla = Vector tamaño n con los valores X
%            yTabla = Vector tamaño n con los valores f(x)
% Salida:    vCoefs = Vector con los coeficientes, ordenados para a0,..an

function vCoefs=newtonDifs(xTabla, yTabla)
    xSize = size(xTabla); n = xSize(2);
    ySize = size(yTabla);
    if xSize(2) ~= ySize(2)
        disp('Deben haber tantos valores de X como de Y')
    else
        % Creamos la variable que almacenara los coeficientes
        vCoefs = zeros(1, n);
        
        % Almacenamos los primeros valores, f(x)
        for i=1:n
            vCoefs(i) = yTabla(i);
        end
        
        % Ciclos principales de la funcion para calcular las diferencias
        % dividas
        for j=2:n
            for i=n:-1:j
                vCoefs(i) = (vCoefs(i) - vCoefs(i-1)) / (xTabla(i) - xTabla(i-j+1));
            end
        end
    end
end
