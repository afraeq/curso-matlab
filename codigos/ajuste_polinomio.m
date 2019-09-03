% dados experimentais 
% benzeno - pressao de vapor X temperatura
P = [    1     5    10    20    40    60   100   200   400   760];           % mmHg
T = [-36.7  -19.6  -11.5   -2.6   7.6   15.4   26.1 42.2   60.6   80.1];     % C

% grau do polinomio a ser ajustado
n = 4;		

% ajustando o poliniomio
c = polyfit(T,P,n)

% avaliando o polinomio para cada T (comparar com os dados experimentais)
z = polyval(c,T)

% dominio de T ''continuo'' (para plotar a correlacao)
Tc = -37:0.1:81;

plot(Tc,c(5)+c(4)*Tc+c(3)*Tc.^2+c(2)*Tc.^3+c(1)*Tc.^4,'-b',T,P,'*r')
title('Pressao de vapor benzeno - ajustada com polinomio de quarto grau')
xlabel('T (C)')
ylabel('P (mm Hg)')