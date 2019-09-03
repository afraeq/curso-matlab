T=input('Insira a temperatura, em graus Celsius \n');

if (T<-273.15)
    fprintf ('Temperatura abaixo do zero absoluto! \n');
elseif (T>-273.15 && T<0)
    fprintf('Agua no estado solido \n');
elseif (T==0)
    fprintf('Agua no equilibrio S-L \n');
elseif (T>0 && T<100)
    fprintf('Agua no estado liquido \n');
elseif (T==100)
    fprintf('Agua no equilibrio L-V \n');
else
    fprintf('Agua no estado vapor \n');
end
