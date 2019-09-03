format long;

while(true)
    
    N=input('\nEscreva o numero de pontos N do somatorio para truncamento ')
    
    if N<0
        warning('esse numero eh negativo, estou saindo')
        break
    end

    % inicializando a soma
    soma = 0;
	
        for n=1:N
            soma = soma + 1/(n^2);
        end

    fprintf('O resultado da soma foi: %f10\nO resultado analitico eh: %f10\n',soma,pi^2/6)
    
end