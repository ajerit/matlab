% Lab 8
% Adolfo Jeritson. 12-10523

% Generamos los vectores x con 10, 30 y 50 puntos.
x10 = linspace(-4*pi,4*pi,10)';
x30 = linspace(-4*pi,4*pi,30)';
x50 = linspace(-4*pi,4*pi,50)';

% Obtenemos los valores de Y con la funcion dada
y10 = zeros(10,1);
for i=1:10
    y10(i) = fsin(x10(i));
end

y30 = zeros(30,1);
for i=1:30
    y30(i) = fsin(x30(i));
end

y50 = zeros(50,1);
for i=1:50
    y50(i) = fsin(x50(i));
end

% Obtenemos el polinomio y su evaluacion en forma canonina
[pCoefsC10,pEvalC10] = canonico(x10,y10);
[pCoefsC30,pEvalC30] = canonico(x30,y30);
[pCoefsC50,pEvalC50] = canonico(x50,y50);

% Obtenemos la evaluacion segun el polinomio de Lagrange
pEvalL10 = zeros(10,1);
for i=1:10
    pEvalL10(i) = neville(x10(i),x10,y10);
end

pEvalL30 = zeros(30,1);
for i=1:30
    pEvalL30(i) = neville(x30(i),x30,y30);
end

pEvalL50 = zeros(50,1);
for i=1:50
    pEvalL50(i) = neville(x50(i),x50,y50);
end

% Valores para graficar F(x)
xF = -4*pi:0.01:4*pi;
n = size(xF);
yF = zeros(1,n(1));
for i=1:n(2)
    yF(i) = fsin(xF(i));
end
    
% Aproximación de f(-6.1333) y f(-1.4142)
% Canonica 50 puntos
yAC1 = horner_nat(pCoefsC50, -6.1333); % -0.0242
yAC2 = horner_nat(pCoefsC50, -1.4142); % 0.3247

% Lagrange 50 puntos
yAL1 = neville(-6.1333, x50, y50); % 0.0358
yAL2 = neville(-1.4142, x50, y50); % 0.4637

% Solucion exacta 
y1 = fsin(-6.1333); % -0.0237
y2 = fsin(-1.4142); % 0.4656

% Error relativo
eC1 = norm(yAC1-y1) / norm(y1); % 0.0187
eC2 = norm(yAC2-y2) / norm(y2); % 0.3026

eL1 = norm(yAL1-y1) / norm(y1); % 2.5092
eL2 = norm(yAL2-y2) / norm(y2); % 0.0042

% Analizando los resultados podemos ver que no siempre con más puntos
% vamos a obtener una mejor aproximación. En el caso del polinomio
% canónico, vemos que su aproximación empieza a dar resultados que se salen
% de lo esperado a medida que aumentan los puntos, mientras que el
% polinomio de Lagrange se mantuvo dentro de un margen aceptable. Sabemos
% por teorema que ambos métodos deben dar el mismo polinomio, y esto se
% cumple en los primeros 10 puntos, pero como tenemos una matriz mal
% condicionada como la de Vandermonde, en la práctica y en el computador,
% la resolución de esta matriz produce errores a medida que se agregan más
% puntos. 
% Como vimos en teoría, el polinomio canónico depende de la resolución de un
% sistema lineal cuya matriz está muy mal condicionada, por lo tanto
% mientras más puntos se incluyan, por la construcción de la matriz, el mal
% condicionamiento va a empeorar, por eso da malos resultados para un
% número elevado de puntos y esa es la mayor desventaja de este polinomio. 
% Lagrange, en cambio, no depende de una matriz mal condicionada, pero para
% evaluarlo se necesitan algunos cálculos un poco más difíciles que para
% evaluar el canónico, pero como podemos ver, a mayor cantidad de puntos,
% mantiene una precisión muy buena.
