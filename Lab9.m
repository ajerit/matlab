% Laboratorio 9
% Adolfo Jeritson. 12-10523

% Vector con 30 y 50 puntos
x30 = linspace(-4*pi, 4*pi, 30);
x50 = linspace(-4*pi, 4*pi, 50);

% Calculamos los valores f(x)
for i=1:30
    y30(i) = fsin(x30(i));
end
for i=1:50
    y50(i) = fsin(x50(i));
end

% Calculamos los coeficientes para los polinomios
nCoefs30 = newtonDifs(x30,y30);
nCoefs50 = newtonDifs(x50,y50);

% Evaluamos con los coeficientes en el polinomio de Newton
eValN30 = horner_newt(x30,nCoefs30,x30);
eValN50 = horner_newt(x50,nCoefs50,x50);

% Hermite
xHer15 = linspace(-4*pi,4*pi,15);
xHer25 = linspace(-4*pi,4*pi,25);
% Valores de f(x)
for i=1:15
    yHer15(i) = fsin(xHer15(i));
end
for i=1:25
    yHer25(i) = fsin(xHer25(i));
end
% Calculo de la derivada
syms x
f = (x*sin(x)) / (x^2 + 1);
fd = diff(f);
for i=1:15
    yDif15(i) = vpa(subs(fd,x,xHer15(i)));
end
for i=1:25
    yDif25(i) = vpa(subs(fd,x,xHer25(i)));
end

% Coeficientes
nCoefHer15 = hermite(xHer15,yHer15,yDif15);
nCoefHer25 = hermite(xHer25,yHer25,yDif25);

% Evaluamos el polinomio
eValH30 = horner_newt(x30,nCoefHer15,x30);
eValH50 = horner_newt(x50,nCoefHer25,x50);

% Nodos de Chebyshev
a = -4*pi; b = 4*pi;
xCheby30 = zeros(1,30); xCheby50 = zeros(1,50); xCheby15 = zeros(1,15); xCheby25 = zeros(1,25);
for i=1:15
    xCheby15(i) = (1/2)*(a+b) + (1/2)*(b-a)*cos(((2*i-1)*pi)/(2*15));
end

for i=1:25
    xCheby25(i) = (1/2)*(a+b) + (1/2)*(b-a)*cos(((2*i-1)*pi)/(2*25));
end

for i=1:30
    xCheby30(i) = (1/2)*(a+b) + (1/2)*(b-a)*cos(((2*i-1)*pi)/(2*30));
end

for i=1:50
    xCheby50(i) = (1/2)*(a+b) + (1/2)*(b-a)*cos(((2*i-1)*pi)/(2*50));
end

% Calculamos los valores f(x) para Chebyshev
for i=1:15
    yCheby15(i) = fsin(xCheby15(i));
end
for i=1:25
    yCheby25(i) = fsin(xCheby25(i));
end
for i=1:30
    yCheby30(i) = fsin(xCheby30(i));
end
for i=1:50
    yCheby50(i) = fsin(xCheby50(i));
end

% Derivadas para Hermite
for i=1:15
    yDifC15(i) = vpa(subs(fd,x,xCheby15(i)));
end
for i=1:25
    yDifC25(i) = vpa(subs(fd,x,xCheby25(i)));
end

% Calculamos los coefs para Chebyshev
nCoefCheby15 = hermite(xCheby15,yCheby15,yDifC15);
nCoefCheby25 = hermite(xCheby25,yCheby25,yDifC25);
nCoefCheby30 = newtonDifs(xCheby30,yCheby30);
nCoefCheby50 = newtonDifs(xCheby50,yCheby50);

% Evaluamos con los coeficientes en el polinomio de Newton
eValNC30 = horner_newt(xCheby30,nCoefCheby30,xCheby30);
eValNC50 = horner_newt(xCheby50,nCoefCheby50,xCheby50);
eValHC30 = horner_newt(xCheby30,nCoefCheby15,xCheby30);
eValHC50 = horner_newt(xCheby50,nCoefCheby25,xCheby50);

% Valores para graficar F(x)
xF = -4*pi:0.01:4*pi;
n = size(xF);
yF = zeros(1,n(1));
for i=1:n(2)
    yF(i) = fsin(xF(i));
end

tiempos = [0 3 5 8 13]; % Valores de X
dist = [0 255 383 623 993]; % Valores de f(x)
vel = [75 77 80 74 72]; % Valores de f'(x)

coefsHer = hermite(tiempos, dist, vel);
x = linspace(0,13,10);
eVal = horner_newt(x, coefsHer, x);
distAt10 = horner_newt(x, coefsHer, 10);




