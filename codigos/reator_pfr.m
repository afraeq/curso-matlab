function reator_pfr

    % parametros
    D = 1.;				% difusividade
    vz = 1.;			% velocidade 
    k = 1.;				% constante de reacao
    cf = 1.;			% concentracao da alimentacao

	% comprimento do reator
	L = .5;

	% numero de pontos em que o dominio sera discretizado (contando as CC)
	N = 10;

	%numero de pontos excluindo as CC
	n = N - 2;

	% comprimento de cada intervalo
	deltaL = L/(N-1);

	function dC = pfr(t,c)
        
        % vetor a ser retornado
        dC = zeros(n,1);

		% condicoes de contorno
		c0 = ((D/(vz*deltaL))*c(1)+cf)/(1 + D/(vz*deltaL));
		cNp1 = c(n);
	
		% equacoes diferenciais
		dC(1) = (D/deltaL^2)*(c(2)-2*c(1)+ c0) - (vz/(2*deltaL))*(c(2)-c0) + k*c(1);

		for i=2:n-1
			dC(i) = (D/deltaL^2)*(c(i+1)-2*c(i)+ c(i-1)) - (vz/(2*deltaL))*(c(i+1)-c(i-1)) + k*c(i);
        end

		dC(n) = (D/deltaL^2)*(cNp1-2*c(n)+ c(n-1)) - (vz/2*deltaL)*(cNp1-c(n-1)) + k*c(n);

    end

	%condicao inicial
	c_inicial = zeros(n,1);

	%resolvendo as edos
	[t,c] = ode45(@pfr,[0 5],c_inicial);

	% plotando
	plot(t,c(:,n))
	hold on

xlabel('t');
ylabel('Cs(t)');
title('Concentracao de saida do PFR');
grid on

end
