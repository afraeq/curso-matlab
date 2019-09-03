% parametros
k = 1:200; alph = 0.4; xi = 0.1;
Omo = 0.03*sqrt(2); N = 400;

% funcao H(Omega)
HOm = @(k,Om,xi) 1./sqrt((1-(Om*k).^2).^2+(2*xi*Om*k).^2);

% malha em tau
tau = linspace(-50, 120, N);

% calculando x(tau)
sn = sin(pi*k*alph)./(pi*k*alph);
thn = atan2(2*xi*Omo*k, (1-(Omo*k).^2));
psi = atan2(sn, 0);
cnt = sin(Omo*k'*tau-repmat(thn', 1, N)+repmat(psi', 1, N));
x = alph*(1+2*abs(sn).*HOm(k, Omo, xi)*cnt);

% plotando o grafico principal
plot(tau, x, 'k-')
a = axis; a(1) = -50; a(2) = 120;
axis(a)
xlabel('\tau')
ylabel('x(\tau)')

% plotando o grafico menor
axes('Position', [0.62, 0.62, 0.25, 0.25])
semilogy(k*Omo, HOm(k, Omo, xi), 'k-')
ylabel('H(\Omega)')
xlabel('\Omega')
box off