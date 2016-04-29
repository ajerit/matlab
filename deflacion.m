function [aValores]=deflacion(A,xInicial)
    n = size(A);
    aValores = ones(n(1),1)';
    for k=1:n(1)-1
        %calculo el AV y X
        [aValor,aVector]=mpotencia(A,xInicial,5000,10^-6);
        aValores(k) = aValor;

        %construyo x buscando el primer elemento distinto de 0
        n=size(aVector);
        for i=1:n(1)
            if aVector(i) ~= 0
                v = aVector(i);
                vIndex = i;
                break
            end
        end

        xVector = (1/(aValor*v))*A(vIndex,:)';

        %calculo b
        A = A - (aValor*aVector)*xVector';
        
        %elimino la fila con ceros y col
        A(vIndex,:) = [];
        A(:,vIndex) = [];
        xInicial(vIndex) = [];
        
    end
end
