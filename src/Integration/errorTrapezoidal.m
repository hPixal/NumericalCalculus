function err = errorTrapezoidal(ddf_ddx,a,b,l)
    h = (a-b)/l
    ((h^5)/90)*d4f_d4x(a+h);
end