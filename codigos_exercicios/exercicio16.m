% inicializando o valor da soma
soma = 0;

% loop
for i=1:20
    for j=3:9
        soma = soma + sin(i+j);
    end
end

% exibindo
soma