function x=richardson(a,b,e,maxit)
    n=size(a);
    x = ones(n(1),1);

    for k=1:maxit
        for i=1:n(1)
            suma=0;
            for j=1:n(1)
                suma=suma+a(i,j)*x(j);
            end
            r(i)=b(i)-suma;
        end
       
        for s=1:n(1)
            
            x(s) = x(s) + r(s);
        end
        
        if norm(r, 'inf') < e
            break
        end
    end
    
end
