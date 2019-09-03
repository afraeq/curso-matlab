#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 18b
"""

import numpy as np

# valor analítico da série
anal = np.pi**2/6

# inicializando a soma (valor numerico)
num = 0

# numero maximo de iteracoes
maxit = 10**8

for i in range(1,maxit+1):
    
    num += 1/(i**2)
    erro = abs(anal-num)
    
    if erro <= 1e-7:
        print('O numero de termos necessario para se atingir um erro absoluto de 10^(-7) foi:',i)
        break   # saindo do loop