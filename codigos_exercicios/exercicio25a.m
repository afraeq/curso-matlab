function f = lista23a(ed,Re)
% Find friction factor by solving the Colebrook equation (Moody Chart)
%
% Synopsis: f = moody(ed,Re)
%
% Input: ed = relative roughness = epsilon/diameter
% Re = Reynolds number
%
% Output: f = friction factor
%
% Note: Laminar and turbulent flow are correctly accounted for
% 
% Suggestion to test: ed = 0.002, Re = 50e3, f = 0.0265

if Re<0
    error('Reynolds number = %f cannot be negative',Re);
elseif Re<2000
    f = 64/Re; return % laminar flow
end

if ed>0.05
    warning('epsilon/diameter ratio = %f is not on Moody chart',ed);
end

if Re<4000, warning('Re = %f in transition range',Re); end

% --- Use fzero to find f from Colebrook equation.
% coleFun is an inline function object to evaluate F(f,e/d,Re)
% fzero returns the value of f such that F(f,e/d/Re) = 0 (approximately)
% fi = initial guess from Haaland equation, see White, equation 6.64a
% Iterations of fzero are terminated when f is known to whithin +/- dfTol

coleFun = @(f) 1.0/sqrt(f) + 2.0*log10( ed/3.7 + 2.51/(Re*sqrt(f)));

fi = 1/(1.8*log10(6.9/Re + (ed/3.7)^1.11))^2; % initial guess at f

dfTol = 5e-6;

f = fzero(coleFun,fi,optimset('TolX',dfTol,'Display','off'));

% --- sanity check:
if f<0, error('Friction factor = %f, but cannot be negative',f); end