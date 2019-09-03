t = 0:.1:10;

x = - 0.1*t.^4 + 0.8* t.^3 + 10*t - 70;
v = - 4*0.1*t.^3 + 0.8*3*t.^2 + 10;
a = -3*4*0.1*t.^2 + 0.8*3*2*t;

subplot(3,1,1)
plot(t,x)
ylabel('x')

subplot(3,1,2)
plot(t,v)
ylabel('v')

subplot(3,1,3)
plot(t,a)
ylabel('a')

xlabel('t')