g = 9.8; % em m/s^2;

format long;

h=input('Digite o valor da altura, em metros: ');

if h<0 
    fprintf('O referencial eh o solo. A altura nao pode ser negativa!\n')
else
    v=sqrt(2*g*h);
    fprintf('A velocidade do corpo em queda livre eh: %f m/s.\n',v)
end 
