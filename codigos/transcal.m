% definindo a funcao teta
theta = @(x,t) erfc(0.5*x./t)-exp(x+t.^2).*erfc(0.5*x./t+t);

% malha de pontos
tau = linspace(0.01, 3, 60); 
eta = linspace(0, 5, 40);
[x, t] = meshgrid(eta, tau);

% plotando a superficie
figure(1)
mesh(x, t, theta(x, t))
xlabel('\eta')
ylabel('\tau')
zlabel('\theta')

% plotando as curvas 2d

figure(2)
eta = 0:5;
tau = linspace(0.01, 4, 80);

for k = 1:length(eta)
    thet = theta(eta(k), tau);
    plot(tau, thet)
    text(.92*4,1.02*thet(end), ['\eta = ' num2str(eta(k))]) 
    hold on
end

xlabel('\tau') 
ylabel('\theta')