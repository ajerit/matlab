function a=mqr(A,maxit,tol)
    AV = A;
    for k=1:maxit
        [Q,R] = qr(AV);
        AN = R*Q;
        AV = AN;
        if norm((diag(AV) - diag(AN)),'inf') < tol
            a=diag(AN);
            break
        end
    end
end