% definindo a funcao a ser minimizada
fun = @(x)(0.5*(x(1)^4-16*x(1)^2+5*x(1))+0.5*(x(2)^4-16*x(2)^2+5*x(2)));

% parametros da funcao particleswarm                    
nvars = 2;                    
lim_inf = [-5, -5];
lim_sup = [5, 5]; 

% minimizando!
[xmin,fmin,eflag,output] = particleswarm (fun,nvars, lim_inf, lim_sup)   


% plotando funcao e seu minimo

x = -5:0.1:5;
y = -5:0.1:5;

[x,y] = meshgrid(x,y);

z = 0.5*(x.^4-16*x.^2+5*x)+0.5*(y.^4-16*y.^2+5*y);

surf(x,y,z)
hold on
plot3(xmin(1), xmin(2), fmin,'*r')