s = 0;                  % soma atual
i = 0;                  % numero atual que estamos somando

while s < 1000000,
  i = i + 1;
  s = s + i;
end

fprintf('A soma de 1 + 2 + ... + %d eh igual a %d\n',i,s);