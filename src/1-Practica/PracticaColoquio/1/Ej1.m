function res = Ej1()
    %Preambulo del ejercicio 6
    k0 = 0.9;
    H = 15;
    uE = 4;

    A = k0;
    B = H;
    C = - uE*H;

    rob = [ A B C ];

    lon = 5; tol = 1e-4;
    ycd = 6; inter = [ 0 lon/2 ];
    h = 0.5; L = abs(inter(1) - inter(end))/h;
    midpoint = abs(inter(1)-inter(end))/2;

    cR = @(x) 0.5*x + 0.5; hSource = @(x) 5.*x.*(5-x)
    f = @(x) [ 0*x cR(x)./k0 -hSource(x)./k0 ]
    
    [x,y]=dif_fin_rob(f,inter,ycd,rob,L);

    p = find( x == midpoint); past = y(p,1);
    clear y; clear x; it = 1;
    
    for i = 1 : 1 : 10000

        L*=2;
        
        [x,y] = dif_fin_rob(f,inter,ycd,rob,L);

        p = find( x == midpoint );
        present = y(p);

        err = abs(past - present);
        if(err < tol )
            break;
        endif

        past = present;
    endfor

    lerp([y x])

    disp("Punto medio de la barra: ")
    present
end