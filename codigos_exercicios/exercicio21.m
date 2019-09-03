function diagramaPxy

    x = 0:0.01:1;

    plot(x,p(x));
    hold on;
    plot(y(x),p(x),'-r');

    title('Diagrama Pxy - Ciclohexano e benzeno, 40 C');
    xlabel('x1,y1');
    ylabel('P (atm)');
    legend('x1','x2');
    grid on;

    function result = p(x)
        result = x.*exp(.458.*(1-x).^2)*.243 + (1-x).*exp(.458.*x.^2)*.241;
    end

    function result = y(x)
        result = (x.*exp(.458.*(1-x).^2)*.243)./(x.*exp(.458.*(1-x).^2)*.243 + (1-x).*exp(.458.*x.^2)*.241);
    end

end