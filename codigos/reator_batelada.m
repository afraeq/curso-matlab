% parametros
k1 = 1;
k2 = 2;

% definindo as equacoes
dCdt = @(t,c)[-k1*c(1); k1*c(1)-k2*c(2); k2*c(2)];

% intervalo de tempo
tspan = [0 5];

% condicoes iniciais
c0 = [5 0 0];

% resolvendo!
[t,c] = ode45(dCdt,tspan,c0);

% plotando
plot(t,c(:,1),'+',t,c(:,2),'*',t,c(:,3))
% ou apenas
% plot(t,c)

% ajeitando o grafico
xlabel('tempo(h)')
ylabel('concentracao, mol/L')
legend('Ca','Cb','Cc')
    
