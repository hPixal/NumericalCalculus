function [finalVal,it,t,r] = simpson(f_x,a,b,tol,maxIt)
    tic();
    dist = abs(a-b);
    last = 0;
    finalVal = 0;
    for i = 1 : maxIt
        n = 2*i;
        w = simpsonWeight(n);
        dx = abs(a-b)/n;
        it2 = 0;
        it++;
        for j = a:dx:b
            it2++;
            it++;
            finalVal = finalVal + f_x(j)*w(it2);
        endfor
        finalVal = finalVal * dx/3;
        if abs(finalVal - last) < tol
            break;
        endif
        last = finalVal;
    endfor
    it
    t = toc();
end
