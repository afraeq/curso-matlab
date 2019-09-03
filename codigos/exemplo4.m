function y = exemplo4 (x1,x2)
%
% Esta funcao retorna o produto escalar entre dois vetores (x1 e x2),
% de acordo com a sintaxe:
%
% y = exemplo4 (x1,x2)

    if (length(x1)~=length(x2))
        disp('nao da pra fazer o produto escalar!')
        return
    end

    y = 0;

    for i = 1: length(x1)
        y = y + x1(i)*x2(i);
    end


