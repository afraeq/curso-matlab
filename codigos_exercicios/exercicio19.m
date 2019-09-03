function [raiz, i] = lista18 (f,df,x,tol,it_max)

% Esta funcao implementa o metodo de Newton-Raphson para o calculo da raiz
% de uma equacao unidimensional.
%
% Sua sintaxe eh:
%
%       function [raiz, nit] = lista18 (f, df, x,tol,it_max)
%
% Sendo:
%
% raiz: resultado
% i: numero de iteracoes realizadas
%
% f: funcao a ser zerada
% df: expressao da derivada de f
% x: estimativa inicial
% tol: tolerancia no valor da funcao
% it_max: numero maximo de iteracoes
%
% exemplo de funcoes f e df
% f = @(x)(x^2 + 2*x - 1);
% df = @(x)(2*x+2);

for i=1:it_max

	x = x-f(x)/df(x);

	if (abs(f(x))<=tol)
		raiz=x;
		return;
	end

end

% acusando o erro:
warning('\nMetodo de Newton falhou apos %d iteracoes.\n\n', it_max)
