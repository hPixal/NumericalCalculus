function [x,y]=dif_fin_dir(f,inter,yc,L)
%function [x,y]=dif_fin_dir(f,[a b],[alpha,beta],L)
%Metodo de diferencias finitas que resuelve
%el problema de valores de contorno lineal
%condiciones Dirichlet
% y = p(x)y + q(x)y + r(x) para x en [a,b]
% y(a)=alpha , y(b)=beta
%f: funcion columnas con las funciones p,q,r
%L: cantidad de subintervalos
p=@(x) f(x)(:,1);
q=@(x) f(x)(:,2);
r=@(x) f(x)(:,3);

#division del intervalo

x=linspace(inter(1),inter(2),L+1)';

h=(inter(2)-inter(1))/L;

#construccion de la matriz
col=[-1-h/2*p(x(3:end)) 2+h^2.*q(x(2:end-1)) -1+h/2*p(x(1:end-2))];
A = spdiags(col, [-1 0 1], L-1, L-1);
#construccion del vector de terminos idependientes
b = -h^2*r(x(2:end-1));
b(1)+=(1+h/2*p(x(2)))*yc(1);
b(end)+=(1-h/2*p(x(end-1)))*yc(2);
#resolucion del sistema
% se puede usar cualquiera de los metodos que vimos en los capitulos 2 y 3
ys=A\b; % M�todo de Octave

#solucion con las condiciones de contorno
y=[yc(1);
ys;yc(2)];