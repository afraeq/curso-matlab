#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 17
"""

import numpy as np

# criando um vetor que armazenara os resultados
a = np.zeros(10)

for i in range(1,11):
    # zerando o valor da soma a cada passo do loop externo!
    soma = 0
    # calculando a soma (loop interno)
    for j in range(1,i+1):
        soma += 3**(j+1)        
    # armazenando o valor da soma no vetor
    a[i] = soma
