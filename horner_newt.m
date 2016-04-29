% Adolfo Jeritson
% 12-10523
% Función para evaluar un polinomio segun el metodo de Horner, para
% polinomios de Newton
% Entradas:   pCoef = Vector fila con los coeficientes del polinomio a evaluar
%             eVar = Vector (puede ser tamaño 1) con los valores a evaluar
%             xTabla = Vector con los valores de X segun el polinomio Newton
% Salida:     p = Vector con el resultado al evaluar el polinomio
function p=horner_newt(xTabla,pCoef,eVar)
    n = size(pCoef);
    p = pCoef(n(2));
    for i=n(2):-1:1
        p = p.*(eVar - xTabla(i)) + pCoef(i);
    end
end
