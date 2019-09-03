#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 18a
"""

import numpy as np

while True:

    N = eval(input('\nEscreva o número de pontos N do somatório para truncamento: '))
    
    if N<0:
        print('\nesse número eh negativo, estou saindo')
        break
    
    # inicializando a soma
    soma = 0
    
    for n in range(1,N+1):
        soma += 1/(n**2)
        
    print('O resultado da soma foi ',soma,'\nO resultado analitico eh',(np.pi**2)/6)
        
        
        