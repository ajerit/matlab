function x=gausspiv_diag_directo(a,b)
    % Vamos a recebir una matriz nxn cualquiera y resuelve directamente,
    % pasando por convertir primero en triangular superior, luego en
    % diagonal y finalmente haciendo sust. directa
    [a1,b1]=gausspiv(a,b);
    [a2,b2]=gauss_arriba(a1,b1);
    x=sust_directa(a2,b2);
end