function ajuste_antoine

    % dados experimentais 
    % benzeno - pressao de vapor X temperatura
    P = [    1     5    10    20    40    60   100   200   400   760] ;          % mmHg
    T = [-36.7  -19.6  -11.5   -2.6   7.6   15.4   26.1 42.2   60.6   80.1];     % C

    % chute inicial para os parametros
    p0(1) = 10;
    p0(2) = 2000;
    p0(3) = 273;

    % minimizacao por minimos quadrados
    p = fminsearch(@fit_c,p0)

    % dominio de T ''continuo'' (para plotar a correlacao)
    Tc = -37:.1:81;

    plot(Tc,p(1)-p(2)./(Tc+p(3)),'-b',T,log10(P),'*r')
    title('Pressao de vapor benzeno - ajustada com equacao de antoine')
    xlabel('T (C)')
    ylabel('log10(P)')

    % funcao objetivo (minimos quadrados)
    function f=fit_c(p)
        a = p(1);
        b = p(2);
        c = p(3);
        erro = log10(P) - a + b./(T+c);
        %   error = P - 10.^(a - b./(T+c));
        f=sum(erro.*erro);
    end

end