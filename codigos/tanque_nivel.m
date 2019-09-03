% parametros
alfa = 1;
beta = 0.5;

% modelos
linear = @(t,h) -((beta^2)/(2*alfa))*(h-alfa^2/beta^2);
nao_linear = @(t,h) alfa-beta*sqrt(h);

% plotando dh/dt X h

h=0:0.1:20;

figure(1);

plot(h,linear(0,h))
hold on
plot(h,nao_linear(0,h),'r')
xlabel('h');
ylabel('d(h(t))/dt');
legend('linear','nao-linear');
grid on

% resolvendo as edo's dos dois modelos e plotando

hinicial=10;

[t,h] = ode45(linear,[0 50],hinicial);
[t2,h2] = ode45(nao_linear,[0 50],hinicial);

figure(2)

plot(t,h)
hold on
plot(t2,h2,'r')
xlabel('t');
ylabel('h(t)');
legend('linear','nao-linear');
grid on

% resolvendo e plotando novamente (no mesmo grafico), mas para outra
% condicao inicial

hinicial=0;

[t,h] = ode45(linear,[0 50],hinicial);
[t2,h2] = ode45(nao_linear,[0 50],hinicial);

plot(t,h)
plot(t2,h2,'r')