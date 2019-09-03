% valor analitico da serie
anal=pi^2/6;

% inicializando a soma (valor numerico)
num=0;

% numero maximo de iteracoes
maxit = 1e8;

for i = 1: maxit

	num = num + 1/(i^2);
	erro=abs(anal-num);

    if (erro <= 1e-7)
        fprintf('\nO numero de termos necessarios para se atingir um erro absoluto de 10^(-7) foi: %d\n',i)
        break       % saindo do loop
    end

end
