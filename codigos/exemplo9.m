% definindo a funcao a ser minimizada
caixa_de_ovos = @(x) (-(x(2)+47)*sin((abs(x(1)/2+x(2)+47))^0.5)-...
                        x(1)*sin((abs(x(1)-(x(2)+47)))^0.5));

% parametros da funcao particleswarm                    
nvars = 2;                    
lim_inf = [-512, -512];
lim_sup = [512, 512];

[xmin,fmin,eflag,output] = particleswarm (caixa_de_ovos,nvars, lim_inf, lim_sup)   

% plotando funcao e seu minimo

x = -512:15:512;
y = -512:15:512;

[X,Y] = meshgrid(x,y);

Z = -(Y+47).*sin((abs(X./2+Y+47)).^0.5) - X.*sin((abs(X-(Y+47))).^0.5);

surf(X,Y,Z)
hold on
plot3(xmin(1), xmin(2), fmin,'*r')