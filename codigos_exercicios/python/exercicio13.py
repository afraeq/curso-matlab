#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 13
"""

import numpy as np

g = 9.8; # m/s**2

h = eval(input('Digite o valor da altura, em metros: '))

if h<0:
    print('\nO referencial eh o solo. A altura nao pode ser negativa!')
else:
    v = np.sqrt(2.0*g*h)
    print('\nA velocidade do corpo em queda livre eh:',v,'m/s')