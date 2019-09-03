#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun  5 13:23:20 2017

@author: afranio
"""

import numpy as np
import scipy.integrate as integ
import matplotlib.pyplot as plt

# parametros

k1 = 1.0
k2 = 2.0

# definindo o sistema de equacoes
def dCdt (C,t):
    return [-k1*C[0], k1*C[0]-k2*C[1], k2*C[1]]
    
# pontos no tempo
t = np.arange(0.0,5.1,0.1)

# condicoes iniciais
c0 = [5, 0, 0]

# resolvendo!
c = integ.odeint(dCdt,c0,t)

#plotando
plt.plot(t,c)

# ajeitando o grafico
plt.xlabel('tempo, h')
plt.ylabel('concentração, mol/L')
plt.legend(['Ca','Cb','Cc'])