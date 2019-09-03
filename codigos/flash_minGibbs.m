function flash_minGibbs

    %% condicao do sistema 
    
    % temperatura
    T = 298.15;
    
    % fracao molar global dos componentes
    z = [.4,.6];
    
    % numero de mols total
    n = 1;
    
    % numero de mols dos componentes
    ni = z* n; 
       
    % numero de componentes
    nc=length(z);
    
    % numero de fases
    nf = 2;
        
    %% parametros UNIQUAC 

    %  1-butanol ~ agua
    r = [3.4543     .92 ];
    q = [3.0520  	1.4 ];
    q1 = q;
    aij = [ 0           -82.688;
        443.56      0 ;];
    tau = exp(-aij/T);
    
    %% encontrando o minimo global da energia de Gibbs com o metodo do enxame de particulas
    
    % parametros da funcao particleswarm                    
    nvars = 2;
    lim_inf = [1e-50, 1e-50];
    lim_sup = [ni(1)-1e-5, ni(2)-1e-5];
    
    % minimizando!
    [xmin,fmin,eflag,output] = particleswarm (@deltaG, nvars, lim_inf, lim_sup)
   
    %% plotando a energia de gibbs e seu otimo global
    
    % tamanho do passo
    step = .05;
        
    % malha
    n_grid1 = 1e-16: step : ni(1)-step;
    n_grid1 = [n_grid1 ni(1)-1e-5];
    n_grid2 = 1e-16: step : ni(2)-step;
    n_grid2 = [n_grid2 ni(2)-1e-5];
    
   % matriz que armazenara os valores de deltaG
    Z = zeros(length(n_grid1),length(n_grid2));
    
    % calculando o deltaG para cada ponto da malha
    for i1=1:length(n_grid1)
        for i2 = 1:length(n_grid2)
            Z(i1,i2) = deltaG([n_grid1(i1);n_grid2(i2)]);       
        end
    end
    
    % finalmente, plotando!
    
    figure(2)
    
    surf(n_grid2, n_grid1, Z);
    
    xlabel('mols de agua')
    ylabel('mols de 1-butanol')
    zlabel('\Delta G')
    title('Fase aquosa')
    
    % marcando o otimo
    hold on;
    plot3(xmin(2),xmin(1),fmin,'*r');   

    %% funcao objetivo para calculo de equilibrio: energia de gibbs
    
    function deltaG = deltaG(nij_vetor)
        
        nij = zeros(nc,nf-1);
        xij = zeros(nc,nf-1);
        ni_nf = zeros(nc,1);
        gamma = zeros(nc,nf-1);
        
        for i=1:nc
            for j=1:nf-1
                nij(i,j) = nij_vetor(j+(i-1)*(nf-1));
            end
        end
        
        deltaG = 0;
                
        for j = 1:nf-1
            for i = 1:nc               
                xij(i,j) = nij(i,j)/sum(nij(:,j));
            end
            gamma(:,j) = uniquac(xij(:,j)', r, q, q1, tau);
        end
                
        for j=1:nf-1
            for i = 1:nc
                deltaG = deltaG + nij(i,j)*log(xij(i,j)*gamma(i,j))/n;
            end
        end
        
        for i=1:nc
                ni_nf(i) = ni(i) - sum(nij(i,:));
        end
        
        xi_nf = ni_nf/sum(ni_nf);
        gamma_nf = uniquac(xi_nf', r, q, q1, tau);
                
        for i = 1:nc
            deltaG = deltaG + ni_nf(i)*log(xi_nf(i)*gamma_nf(i))/n;
        end
        
    end 
    
end