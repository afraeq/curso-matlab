% definindo a funcao a ser minimizada
rosenbrock = @(x)(100*(x(2) - x(1).^2).^2 + (1 - x(1)).^2);

% chute inicial
x0 = [0,0];

% minimizando!
[xmin,fmin,eflag,output] = fminsearch(rosenbrock,x0)   

% plotando funcao e seu minimo

x = -2:0.1:2;
y = -1:0.1:3;

[x,y] = meshgrid(x,y);

z = 100*(y-x.^2).^2 +(1-x).^2;

surf(x,y,z)
hold on
plot3(xmin(1), xmin(2), fmin,'*r')