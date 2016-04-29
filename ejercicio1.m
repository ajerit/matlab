% Adolfo Jeritson
% 12-10523
% Solución del ejercicio 1 de Lab4

function S=ejercicio1(n)
    h = 1/n;
    
    % Construimos el vector F
    x = 0:h:1;
    F = x(2:n);
    
    % Construimos la matriz A
    A = 2*eye(n-1);
    for i=1:n-2
        A(i,i+1) = -1;
        A(i+1,i) = -1;
    end
    
    A = A*1/h^2;
    
    % Buscamos la factorizacion LU
    [L,U] = tridiagonal(A);
    
    % Resolvemos el sistema
    y = sust_adelante(L,F);
    S = sust_atras(U,y);
    
    % Añadimos las respuestas de los casos frontera
    S = [0 S 0];
    
    % Hacemos el grafico de la solucion
    plot(x,S)
    
end
