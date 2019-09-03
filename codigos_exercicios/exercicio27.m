function lista25

    global A B C P T_guess x2

    % parametros da equacao de antoine
    A = [6.90565 6.95464];
    B = [1211.033 1344.8];
    C = [220.79 219.482];

    P = 1.2*760;								%	mmHg
    Lo = 100;									%	moles
    xstart = 0.40;								%	mol/tolueno
    xfinal = 0.80;								%	mol/tolueno

    % chute da temperatura para o calculo do ponto de bolha
    T_guess = (80.1+110.6)/2;					%	C

    % resolvendo a equacao diferencial
    [x L] = ode45(@distill,[xstart xfinal],Lo);

    plot(x,L,'r')
    title('Destilacao em batelada')
    xlabel('Fracao molar do tolueno')
    ylabel('Mols de liquido remanescentes')

    function dL_dx = distill (x,L)
        x2 = x;
        T = fzero(@bolha,T_guess);  % resolvendo a equacao algebrica do ponto de bolha, dentro da EDO!
        P_i = 10.^(A-B./(T+C));
        k = P_i./P;
        dL_dx = L/x2/(k(2)-1);
    end

    function f = bolha(T)
        x1 = 1-x2;
        P_i = 10.^(A-B./(T+C));
        k = P_i./P;
        f = 1 - k(1)*x1 - k(2)*x2;
    end

end
