% definindo o sistema
rigid = @(t,y) [y(2) * y(3); -y(1) * y(3); -0.51 * y(1) * y(2)];

% resolvendo
options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-5]);
[T,Y] = ode45(rigid,[0 12],[0 1 1],options);

% plotando
plot(T,Y(:,1),'-',T,Y(:,2),'-.',T,Y(:,3),'.')