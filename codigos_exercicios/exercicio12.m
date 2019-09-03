%% AEROFOLIO DE JOUKOWSKI

%% caracteristicas do cilindro e do escoamento

% raio do cilindro
R = 1.0; 

% velocidade do escoamento
Q = 1.0; 

% angulo do escoamento em relacao a horizontal
alpha = 8.0*pi/180;

% coordenadas do centro do cilindro
ksioff = -0.093*R; 
etaoff = 0.08*R; 
zetaoff = complex(ksioff, etaoff);

%% letra a

% circulacao Gamma
thetaTE = -asin(etaoff/R);
Gamma = 4*pi*Q*R*sin(alpha-thetaTE);

%% letra b

% criando a malha em zeta = ksi + i*eta
nksi = 800; ksimin = -3.5*R; ksimax = 2.5*R;
neta = 800; etamin = -2.5*R; etamax = 2.5*R;
[ksi, eta] = meshgrid(linspace(ksimin, ksimax, nksi),linspace(etamin, etamax, neta));
zeta = complex(ksi, eta);

%% letra c

% potencial de velocidades complexo
F = Q*exp(-1i*alpha)*(zeta-zetaoff)+ ...
    Q*exp(1i*alpha)*R^2./(zeta-zetaoff)+ ...
    1i*Gamma/(2*pi).*log((zeta-zetaoff)/R);

% funcoes de corrente
StreamFunction = imag(F);

%% letra d
% escoamento ao redor do cilindro

figure(1)
hold on

% calculando as linhas de corrente na superficie do cilindro
zeta_sup = complex(ksioff+R, etaoff);
F_sup = Q*exp(-1i*alpha)*(zeta_sup-zetaoff)+ ...
      Q*exp(1i*alpha)*R^2./(zeta_sup-zetaoff)+ ...
      1i*Gamma/(2*pi).*log((zeta_sup-zetaoff)/R);
StreamFunction_sup = imag(F_sup);

% forcando as linhas de corrente dentro do cilindro a serem iguais 
% as linhas de corrente na superficie

 % calculando distancia dos pontos ao centro do cilindro no plano complexo!
distancia_ao_centro = sqrt((ksi-ksioff).^2+(eta-etaoff).^2);

% indices dos pontos cuja distancia ao centro eh menor que o raio!
indx_dentro = find(distancia_ao_centro<=R);

% se o ponto estiver no cilindro, a StreamFunction sera a mesma da
% superficie
StreamFunction(indx_dentro) = StreamFunction_sup;

% niveis a serem plotados
% cada nivel eh uma linha de corrente
levmin = StreamFunction(1,1);
levmax = StreamFunction(neta,nksi);
levels = linspace(levmin, levmax, 50);

% plotando as linhas de corrente!
contour(ksi, eta, StreamFunction, levels)

% plotando o cilindro
theta = linspace(0, 2*pi, 1000);
zetac = R*exp(1i*theta)+zetaoff; % formula do circulo no plano complexo
plot(zetac, 'k-')

% plotando os pontos LE e TE
ksiTE = ksioff + sqrt(R^2-etaoff^2); % teorema de pitagoras
ksiLE = ksioff - sqrt(R^2-etaoff^2);
plot(ksiTE, 0 ,'or')
plot(ksiLE, 0, 'sr')
text(ksiTE-0.35*R, 0, 'TE')
text(ksiLE+0.2*R,0, 'LE')

% formatando o grafico
axis equal
grid
axis([ksimin, ksimax, etamin, etamax])
xlabel('\xi')
ylabel('i\eta')

%% letra e
% escoamento a redor do aerofolio

figure(2)
hold on

% transformacao de variaveis: zeta em z
lambda = ksioff + sqrt(R^2-etaoff^2);
z = zeta + lambda^2./zeta;
x = real(z);
y = imag(z);

% plotando as linhas de corrente!
contour(x, y, StreamFunction, levels)

% plotando o aerofolio
zair = zetac+lambda^2./zetac;
%xair = real(zair);
plot(zair, 'k')

% plotando os pontos LE e TE
zetaTE = complex(ksiTE, 0);
zetaLE = complex(ksiLE, 0);
zTE = zetaTE+lambda^2/zetaTE;
zLE = zetaLE+lambda^2/zetaLE;
plot(zTE, 0, 'or')
plot(zLE, 0, 'sr')

% formatando o grafico
axis equal
axis([ksimin, ksimax, etamin, etamax])
xlabel('x')
ylabel('iy')

%% letra f
% campo de pressoes em torno do aerofolio

figure(3)
hold on

% velocidade local w
w = (Q*exp(-1i*alpha)-Q*exp(1i*alpha)*R^2./(zeta-zetaoff).^2+ ...
1i*Gamma/(2*pi)./(zeta-zetaoff))./(1.0-lambda^2./zeta.^2);

% coeficientes de pressao
Cp = 1.0-w.*conj(w)/Q^2;
Cp(indx_dentro) = 0.0;

% niveis de pressao a serem plotados
levels = linspace(-10, 1, 150);

% plotando as linhas de contorno!
contour(x, y, Cp, levels)

% plotando o aerofolio
plot(zair, 'k-')

% formatando o grafico
axis equal
axis([ksimin, ksimax, etamin, etamax])
xlabel('x')
ylabel('iy')