% item a
syms x real;
f = (3*x^3 + 17*x^2 + 6*x + 1)/(2*x^3 - x + 3)

% item b
ezplot(f)
hold on
grid
hold off

% item c
limit(f, x, -inf)
limit(f, x, inf)

% item d
solve(2*x^3 - x + 3, x)
double(ans)

% item e
g = diff(f, x)
solve(g, x)
double(ans)

% item f
h = diff(f, x, 2)
solve(h,x)
double(ans)
