function x=pinterno(A,B)
    n=size(A);
    x=0;
    for k=1:n(1)
        x = x + A(k)*B(k);
    end
end

