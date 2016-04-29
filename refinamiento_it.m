function x=refinamiento_it(A,B,e)
% e es opcional
    if nargin < 2
        e = 10^-6;
    end
    % Vector incial es solucion aproximada
    % x = resolver_lu(A,B);
    
    % Vector inicial es 0
    n=size(A);
    x = zeros(n(1),1);
    r = B - A*x;
    
    dx = resolver_lu(A, r);
    dx = dx';
    
    while norm(r, 'inf') >= e
        y = x + dx;
        r = B - A*y;
        dx = resolver_lu(A, r);
        
        x = y;
    end
end
