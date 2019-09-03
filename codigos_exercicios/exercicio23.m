% definindo o sistema
myfun = @(x) [2*x(1) - x(2) - exp(-x(1));
    -x(1) + 2*x(2) - exp(-x(2))];

% estimativa inicial
x0 = [-5; -5];

% opcao para mostrar o output
options = optimoptions('fsolve','Display','iter');

% resolvendo
[x, valor_funcao] = fsolve(myfun,x0,options)