function [a,x]=mpotencia(A, x, maxit, tol)
    for k=1:maxit
        y = x;
        x = A*x;
        if norm(x,2)==0
            break
        else
            x = x/norm(x,2);
        end
        
        if norm(y-x,2) < tol
            a=pinterno(A*x,x);
            break
        end
    end
end
