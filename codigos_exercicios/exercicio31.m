function lista30

    L = 300; 
    Q = 76;
    [D, custo_min] = fminbnd(@custo_anual, 15, 50, [], L, Q)

    function f = custo_anual(D, L, Q)
        hp = 0.0281*L*Q^3./D.^5+(6.6768e-004*L*Q^2.68)./(D.^4.68); 
        f = 1.476*L+0.0063*L*D.^1.5+325*hp.^0.5+61.6*hp.^0.925+102; 