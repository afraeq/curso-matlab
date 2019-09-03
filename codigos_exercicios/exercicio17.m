% criando um vetor que armazenara os resultados
a = zeros(10,1);

for i = 1:10
    
    % zerando o valor da soma a cada passo do loop externo!
    soma = 0;
    
    % calculando a soma (loop interno)
    for j = 1:i
        soma = soma + 3^(j+1);
    end
    
    % armazenando o valor da soma no vetor
    a(i) = soma;
    
end

% exibindo o vetor das somas
a