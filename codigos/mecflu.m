function mecflu

% definindo parametros
nu = 1.0; Uplate = 5.0;
ny = 100; ymax = 10.0;
nt = 40; tmax = 100.0;
A = tmax/((nt+1)^2);

% malhas
y = linspace(0, ymax, ny);
t = A*((1:nt)+1).^2;

% resolvendo a equacao
u = pdepe(0, @pdfslpde, @pdfslic, @pdfslbc, y, t, [], nu, Uplate); 

hold on

for ijd = 2:nt
    plot(u(ijd,:), y, 'k-') 
end

xlabel('u (cm/s)')
ylabel('y (cm)')
text(y(ny/2), u(nt,ny/2), ['t = ' num2str(tmax, 4) ' s']) 
xlim([0, 6])

function [c, f, s] = pdfslpde(x, t, u, DuDy, nu, Uplate) 
    c = 1/nu; f = DuDy;
    s = 0;

function u0 = pdfslic(y, nu, Uplate) 
    u0 = 0;

function [pl, ql, pr, qr] = pdfslbc(yl ,ul, yr, ur, t, nu, Uplate) 
    pl = ul-Uplate; ql = 0;
    pr=0; qr=1;