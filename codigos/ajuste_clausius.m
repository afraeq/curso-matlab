% dados experimentais 
% benzeno - pressao de vapor X temperatura
P = [    1     5    10    20    40    60   100   200   400   760];           % mmHg
T = [-36.7  -19.6  -11.5   -2.6   7.6   15.4   26.1 42.2   60.6   80.1];     % C

% criando as novas variaveis
y = log10(P);
x = 1./(T+273.15);		

% ajustando o poliniomio (grau 1, reta!)
c = polyfit(x,y,1)

% avaliando o polinomio para cada x (comparar com os dados experimentais)
z = polyval(c,x)

% dominio de x ''continuo'' (para plotar a correlacao)
xc = linspace(x(1),x(length(x)),50);

plot(xc,c(2)+c(1)*xc,'-b',x,y,'*r')
title('Pressao de vapor benzeno - ajustada com a equacao de clausius-clapeyron')
xlabel('1/T (K)')
ylabel('log10(P)')