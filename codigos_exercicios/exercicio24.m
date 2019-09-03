% definindo a equacao
myfun = @(x) x*x*x-[1,2;3,4];

% chute inicial
x0 = ones(2,2);

% desligando o display
options = optimoptions('fsolve','Display','off');

% resolvendo!
[x,Fval,exitflag] = fsolve(myfun,x0,options)

