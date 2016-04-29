% Algoritmo para solucionar una matriz triangular superior usando
% sustitución hacia atrás
% Entrada: a = Matriz triangular superior con diagonal no nula, tamaño nxn
%          b = Vector de coeficientes de tamaño n
% Salida:  x = Vector con soluciones

function x=sust_atras(a, b)
    % Calculamos dimensión de la matriz a y tamaño del vector b
    [n, m] = size(a);
    l = length(b);
    
    % Verificamos que la matriz a sea cuadrada y coincida con el vector b
    if (n == m && n == l)
        % Calculamos la última incognita que va a ser usada más adelante para
        % empezar a sustituir hacia atrás
        x(n) = b(n)/a(n,n);
        % Primer ciclo del algoritmo empezando desde n-1 porque en n ya se calculó
        for i = n-1:-1:1
            suma = 0;
            % Segundo ciclo que calcula la sumatoria
            for j = i + 1:n
                % Primera parte del calculo donde se usa la incognita ya resuelta
                suma = suma + a(i,j)*x(j);
            end
            % Cálculo de todas las incognitas haciendo sustitución hacia atrás
            x(i) = (b(i) - suma)/a(i,i);
        end
    else 
        disp('La matriz no es cuadrada o no coincide con el vector b')
    end
end