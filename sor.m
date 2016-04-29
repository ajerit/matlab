function x=sor(a,b,w,e,maxit)
    n=size(a);
    x = zeros(n(1),1);
    z = zeros(n(1),1);
    
    for k=1:maxit
        for i=1:n
            
            suma1=0;
            for j=1:i-1
                suma1=suma1+a(i,j)*z(j);
            end

            suma2=0;
            for j=i+1:n
                suma2=suma2+a(i,j)*x(j);
            end
            
            z(i) = (w*b(i) - w*suma1 - suma2 + (1-w)*a(i,i)*x(i)) / a(i,i); 
      
        end
        if abs(z - x) < e
            break
        end
        x = z;
    end
    disp('Número de iteraciones:')
    disp(k)
end

