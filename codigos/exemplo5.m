% funcoes a serem zeradas
fun = @(s)[s(1)/( 1 + (s(1)/3 - 1)*exp(-s(2)*27)) - 5;
                   s(1)/( 1 + (s(1)/3 - 1)*exp(-s(2)*39)) - 6];

% condicoes iniciais
x0 = [10 .5];

% resolvendo
fsolve(fun,x0,optimset('Display','iter'))
