t1 = -9:3:9;

%y1 = zeros(length(t1),1);

for i=1:length(t1)
    if t1(i)>=0
        y1(i) = -3*t1(i)^2 + 5;
    else
        y1(i) = 3*t1(i)^2 + 5;
    end
end

y1

subplot(2,1,1)

plot(t1,y1)
%figure(2)

t2 = -9:0.1:9;

for i=1:length(t2)
    if t2(i)>=0
        y2(i) = -3*t2(i)^2 + 5;
    else
        y2(i) = 3*t2(i)^2 + 5;
    end
end

subplot(2,1,2)

plot(t2,y2)