t = 1970:2000;

termo = 1 + exp(-0.0313*(t - 1913.25));
P = 197273000./termo;

plot(t,P)
xlabel('ano'), ylabel('populacao')

P2020 = 197273000/(1 + exp(-0.0313*(2020 - 1913.25)))