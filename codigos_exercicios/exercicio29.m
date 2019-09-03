% definindo a funcao a ser minimizada
fun = @(x)(x(1)^2+x(2)^2);

% chute inicial
x0 = [1,1];

% minimizando!
[xmin,fmin,eflag,output] = fminsearch(fun,x0)   

% plotando funcao e seu minimo

x = -2:0.1:2;
y = -2:0.1:2;

[x,y] = meshgrid(x,y);

z = x.^2+y.^2;

surf(x,y,z)
hold on
plot3(xmin(1), xmin(2), fmin,'*r')