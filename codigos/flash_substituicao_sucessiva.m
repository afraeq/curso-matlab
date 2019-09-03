% Calculo do Equilibrio Liquido-Liquido Multicomponente via Substituicao
% Sucessiva na Equacao de Rashford-Rice
%
% Adaptado de:
% Introductory Chemical Engineering Thermodynamics - Eliott; Lira

%% variaveis

% T - temperatura, em Kelvin
% z - vetor das composicoes globais

% erroK - variacao de K, dividida por K
% tol - tolerancia (valor aceitavel de erroK)
% count - contador
% ncomp - numero de componentes
% nf - numero de fases

% x - matriz das composicoes (componentes nas linhas e fases nas colunas)
% gamma - matriz dos coeficientes de atividade (componentes nas linhas e fases nas colunas)

% B - razao entre as quantidades das fases
% K - vetor com os valores de K

% r, q, q1, aij, tau - parametros do UNIQUAC
% tau, alpha - parametros do NRTL

%% inputs do flash

T = 298.15;

z = [.4; .6];                     % caso butanol, agua
%z = [.148; .052; .8];            % caso propanol, butanol, agua
%z = [.2; .78; .02];              % caso metanol, butanol, agua

chute_x = [0.1; 0.9];             % caso butanol agua
%chute_x = [0.1; 0.05; 0.84];     % caso propanol, butanol, agua
%chute_x = [0.1; 0.8; 0.1];       % caso metanol, butanol, agua

chute_B = 0.5;
nf = 2;

%%   parametros UNIQUAC

 % 1-butanol ~ agua ~ metanol
% r = [3.4543     .92     1.4311];
% q = [3.0520  	1.4     1.432];
% q1 = q;
% aij = [ 0           -82.688     355.54;
%         443.56      0           -321.92;
%         -164.09     -84.451     0];
% tau = exp(-aij/TK);

%               1-butanol ~ agua
r = [3.4543     .92 ];
q = [3.0520  	1.4 ];
q1 = q;
aij = [ 0           -82.688;
    443.56      0 ;];
tau = exp(-aij/T);

%% parametros NRTL
%n-propanol - n-butanol - agua

% tau = [0        -0.61259    -0.07149;
%        0.71640  0.          0.90047;
%        2.7425   3.51307     0.];
%
% alpha = [0      0.3     0.3
%          0.3    0.      0.48
%          0.3    0.48    0.];

%% aspectos numericos
erroK = 1;
tol = 1e-5;
count = 0;
ncomp = length(z);

format long;

%% inicializando vetor de composicoes das fases
x = zeros (length(z), nf) + 1e-50; % Zeros exatos aqui podem levar a solucoes NaN

%% Passo 1: estimar a composicao de uma das fases e o B

% estimando composicao da primeira fase
x(:,1) = chute_x;

% estimando B
B = zeros(nf,1);
B(1) = chute_B;

%% Passo 2 - calcular a composicao da outra fase com o balanco material

% calculando a composicao da fase 2
x(:,2) = (z - B(1)*x(:,1))./(1-B(1));

%% Passo 3 - calcular todos os gamma e K

gamma(:,1) = uniquac(x(:,1)', r, q, q1, tau);
gamma(:,2) = uniquac(x(:,2)', r, q, q1, tau);
%gamma(:,1) = nrtl(x(:,1)',tau,alpha);
%gamma(:,2) = nrtl(x(:,2)',tau,alpha);

K = gamma(:,1)./gamma(:,2);

fprintf('x(:,1): \n%.12f %.12f \n\n',x(:,1))
fprintf('x(:,2): \n%.12f %.12f \n\n',x(:,2))

%% Loop principal

while erroK > tol
    
    %% Passo 4 - resolver a equacao de rashford-rice e encontrar B

    % funcao objetivo rashford-rice
    obj = @(B)(sum(z./(B(1)+K*(1-B(1))))-1);
    
    % resolvendo a equacao de rashford-rice, usando o ultimo B como chute
    Bnew = fzero(obj,B(1));

    % armazenando B
    B(1) = Bnew;
    B(2) = 1 - B(1);
    
    %% Passo 5: calcular todas as composicoes

    % Calculando novas composicoes
    x(:,1) = z./(B(1)+K*(1-B(1)));
    x(:,2) = x(:,1).*K;
    
    % Normalizando composicoes
    x(:,1) = x(:,1)/sum(x(:,1));
    x(:,2) = x(:,2)/sum(x(:,2));

    %% Retorno ao Passo 3
    
    % Calculando novos K

    gamma(:,1) = uniquac(x(:,1)', r, q, q1, tau);
    gamma(:,2) = uniquac(x(:,2)', r, q, q1, tau);
    %gamma(:,1) = nrtl(x(:,1)',tau,alpha);
    %gamma(:,2) = nrtl(x(:,2)',tau,alpha);

    Knew = gamma(:,1)./gamma(:,2);

    % calculando dG, a energia de gibbs de mistura adimensional
    % se o algoritmo estiver correto, esse valor deve diminuir a cada passo
    % do loop

    dG = 0;

    for j=1:2
        for i = 1:ncomp
            dG = dG + B(j)*x(i,j)*log(x(i,j)*gamma(i,j));
        end
    end

    % imprimindo valores

    fprintf('---------------------------------- %d \n',count)
    fprintf('x(:,1): \n%.12f %.12f \n\n',x(:,1))
    fprintf('x(:,2): \n%.12f %.12f \n\n',x(:,2))
    fprintf('beta: \n%.12f %.10f\n\n',B)
    fprintf('deltaG: \n%.12f\n\n',dG)
    
    %% testando: saio ou nao do loop?

    % calculando variacao de K e determinando se K convergiu
    erroK = sum(abs(Knew - K)./(K));
    K = Knew;

    % sair do loop, se demorar demais
    count = count + 1;
    if count > 10000
        error('Nao convergiu :/');
    end

    % os valores de K se tornam 1 se existe apenas uma fase
    if ((K(1) < 1+tol) && (K(1) > 1-tol))
        error('Ha apenas uma fase nesse sistema!');
    end

end
