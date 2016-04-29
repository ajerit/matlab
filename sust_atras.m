% Algoritmo para solucionar una matriz triangular superior usando
% sustituci�n hacia atr�s
% Entrada: a = Matriz triangular superior con diagonal no nula, tama�o nxn
%          b = Vector de coeficientes de tama�o n
% Salida:  x = Vector con soluciones

function x=sust_atras(a, b)
    % Calculamos dimensi�n de la matriz a y tama�o del vector b
    [n, m] = size(a);
    l = length(b);
    
    % Verificamos que la matriz a sea cuadrada y coincida con el vector b
    if (n == m && n == l)
        % Calculamos la �ltima incognita que va a ser usada m�s adelante para
        % empezar a sustituir hacia atr�s
        x(n) = b(n)/a(n,n);
        % Primer ciclo del algoritmo empezando desde n-1 porque en n ya se calcul�
        for i = n-1:-1:1
            suma = 0;
            % Segundo ciclo que calcula la sumatoria
            for j = i + 1:n
                % Primera parte del calculo donde se usa la incognita ya resuelta
                suma = suma + a(i,j)*x(j);
            end
            % C�lculo de todas las incognitas haciendo sustituci�n hacia atr�s
            x(i) = (b(i) - suma)/a(i,i);
        end
    else 
        disp('La matriz no es cuadrada o no coincide con el vector b')
    end
end