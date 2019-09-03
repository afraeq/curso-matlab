function exemplo7

    % sistema de coordenadas cartesiano
    m = 0;
    
    % malhas
    x = linspace(0,1,30);
    t = linspace(0,2,30);

    % resolvendo as equacoes
    u = pdepe(m,@pdex1pde,@pdex1ic,@pdex1bc,x,t);

    % plotando a superficie
    surf(x,t,u) 
    title('Solucao numerica calculada com 20 pontos na malha.')
    xlabel('Distancia x')
    ylabel('Tempo t')

    % um perfil da solucao
    figure
    plot(x,u(2,:))
    title('Solucao em t = 2')
    xlabel('Distancia x')
    ylabel('u(x,2)')
    axis([0 1 -0.5 1])
    
    % --------------------------------------------------------------
    function [c,f,s] = pdex1pde(x,t,u,DuDx)
        c = pi^2;
        f = DuDx;
        s = 0;
    % --------------------------------------------------------------
    function u0 = pdex1ic(x)
        u0 = sin(pi*x);
    % --------------------------------------------------------------
    function [pl,ql,pr,qr] = pdex1bc(xl,ul,xr,ur,t)
        pl = ul;
        ql = 0;
        pr = pi * exp(-t);
        qr = 1;
