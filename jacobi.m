function x=jacobi(a,b,e,maxit)
    n=size(a);
    x = zeros(n(1),1);
    z = zeros(n(1),1);
    
    for k=1:maxit
        for i=1:n
            suma=0;
            for j=1:i-1
                suma=suma+a(i,j)*x(j);
            end

            suma2=0;
            for j=i+1:n
                suma2=suma2+a(i,j)*x(j);
            end
            z(i) = (b(i) - (suma + suma2)) / a(i,i); 
      
        end
        if abs(z - x) < e
            break
        end
        x = z;
    end
    disp('Número de iteraciones:')
    disp(k)
end
