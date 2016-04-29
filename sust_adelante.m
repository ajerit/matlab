% Algoritmo para solucionar una matriz triangular inferior usando
% sustituci�n hacia adelante
% Entrada: a = Matriz triangular inferior con diagonal no nula, tama�o nxn
%          b = Vector de coeficientes de tama�o n
% Salida:  x = Vector con soluciones

function x=sust_adelante(a, b)
    % Calculamos dimensi�n de la matriz a y tama�o del vector b
    [n, m] = size(a);
    l = length(b);
    
    % Verificamos que la matriz a sea cuadrada y coincida con el vector b
    if (n == m && n == l)
        % Asignamos el espacio en el vector resultado para mayor rapid�z
        x = zeros(1,n);
        
        % Calculamos la primera incognita que va a ser usada m�s adelante para
        % empezar a sustituir hacia adelante
        x(1) = b(1)/a(1,1);
        % Primer ciclo del algoritmo empezando desde 2 porque x(1) ya se calcul�
        for i = 2:n
            suma = 0;
            % Segundo ciclo que calcula la sumatoria
            for j = 1:i-1
                % Primera parte del calculo donde se usa la incognita ya resuelta
                suma = suma + a(i,j)*x(j);
            end
            % C�lculo de todas las incognitas haciendo sustituci�n hacia
            % adelante
            x(i) = (b(i) - suma)/a(i,i);
        end
    else 
        disp('La matriz no es cuadrada o no coincide con el vector b')
    end
end