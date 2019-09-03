% inicializando a soma
soma = 0;    

% calculando a soma
for i=1:6
    soma = soma + 3^(i+1);
end

fprintf('\nO resultado eh: %d\n\n', soma);