% Adolfo Jeritson
% 12-10523
% Función para evaluar un polinomio segun el metodo de Horner, para
% polinomios canonicos
% Entradas:   pCoef = Vector fila con los coeficientes del polinomio a evaluar
%             eVar = Vector (puede ser tamaño 1) con los valores a evaluar
% Salida:     p = Vector con el resultado al evaluar el polinomio
function p=horner_nat(pCoef,eVar)
    n = size(pCoef);
    p = pCoef(n(2));
    for i=n(2):-1:2
        p = (p.*eVar) + pCoef(i-1);
    end
end
