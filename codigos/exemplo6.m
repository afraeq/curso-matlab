% definindo a equacao diferencial
rhs = @(t,x) 3*exp(-t);

% intervalo de tempo da solucao
t = 0:0.1:5;

% condicao inicial
x0 = 5;

% resolvendo
[t,x] = ode45(rhs, t, x0);

%exibindo resultado
plot(t,x);
xlabel('t'); ylabel('x');