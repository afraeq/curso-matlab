function gamma=nrtl(x, tau, alpha)
% This program calculates activity coefficients using the NRTL equation.
% Each call to nrtl evaluates one composition.
% x = vector of n mole fractions for an n-component mixture, length n.
% tau = tau values, square matrix, n x n.
% alpha = alpha values, square matrix, n x n.
%   The alpha matrix is symmetrical with zeros on the diagonals.

%this statement calculates the number of components 
nComp=length(x);

% make sure x is not identically zero
x = x + 1e-50;

if size(tau,2)~= size(tau,1)
    fprintf('Energy matrix tau should be square, but shows %d columns and %d rows.\nErrors will result.\n',size(tau,1),size(tau,2))
end
if nComp ~= size(tau,2)
    fprintf('Composition vector x indicates %d components, but energy matrix tau indicates %d components. \nErrors will result.\n',nComp,size(tau,2))
end
if size(alpha,2)~= size(alpha,1)
    fprintf('Alpha should be square, but shows %d columns and %d rows.\nErrors will result.\n',size(alpha,1),size(alpha,2))
end
if nComp ~= size(alpha,2)
    fprintf('Composition vector x indicates %d components, but alpha matrix indicates %d components. \nErrors will result.\n',nComp,size(alpha,2))
end

%this will create a matrix with all the rows equal to the vector of
%compositions
Y = kron(x,ones(nComp,1));

G=exp(-alpha.*tau);

term1=x*(tau.*G);
term2=x*G;
inverseterm2 = (1./term2);
squareinverseterm2=inverseterm2.^2;

part1=(term1./term2);
%part2=x*(tau.*G)'./term2
part2=inverseterm2*((Y.*tau.*G)');
%part3=-((x.*term1)*G')./(term2.^2);
part3=(term1.*squareinverseterm2)*((Y.*G)');
    
%logGamma=(term1./term2) + (x*(tau.*G)')./term2 - ((x.*term1)*G')./(term2.^2);
logGamma = part1 + part2 - part3;
gamma=exp(logGamma);

end

% ver 1.02 4/20/13 improve documentation
% ver 1.01 error checking for input dimensions