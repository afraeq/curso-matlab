function lista23b
% Make a simple Moody chart

% --- Generate a log-spaced vector of Re values in the range 2500 <= Re < 10^8
Re = logspace(log10(2500),8,50);
ed = [0 0.00005 0.0002 0.005 0.001 0.005 0.02];

f = zeros(size(Re));

% --- Plot f(Re) curves for one value of epsilon/D at a time

% Temporarily turn warnings off to avoid lots of messges when
% 2000 < Re < 4000
warning off;

hold on;

% turbulent flow
for i=1:length(ed)
    for j=1:length(Re)
        f(j) = lista23a(ed(i),Re(j));
    end
    loglog(Re,f,'k-');
end

% laminar flow
ReLam = [100 2000];
fLam = 64./ReLam;
loglog(ReLam,fLam,'r-');
xlabel('Re'); ylabel('f','Rotation',0)

axis([100 1e9 5e-3 2e-1]); 
hold off; 
grid on

% --- MATLAB resets loglog scale? Set it back
set(gca,'Xscale','log','Yscale','log');

% --- Add text labels like "epsilon/D = ..." at right end of the plot

Remax = max(Re); ReLabel = 10^( floor(log10(Remax)) - 1);

for i=2:length(ed)
    fLabel = lista23a(ed(i),Remax);
    text(ReLabel,1.1*fLabel,sprintf('\\epsilon/D = %5.4f',ed(i)),'FontSize',14);
end