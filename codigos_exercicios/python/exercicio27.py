#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 27
"""

import numpy as np
import scipy.integrate as integ
import scipy.optimize as opt
import matplotlib.pyplot as plt

# parametros da equacao de antoine
A = np.array([6.90565, 6.95464])
B = np.array([1211.033, 1344.8])
C = np.array([220.79, 219.482])

P = 1.2*760         # mmHg
L0 = 100            # moles
xstart = 0.40       # mol/tolueno
xfinal = 0.80       # mol/tolueno

#chute da temperatura para o calculo do ponto de bolha
T_guess = (80.1+110.6)/2.0    # graus celsius
         
# funcao da EDO
def distil (L,x2):
    x = np.array([1.0-x2,x2])
    T = opt.fsolve(bolha,T_guess,args=(x))
    P_i = 10**(A-B/(T+C))
    k = P_i/P
    return L/(x2*(k[1]-1))

# funcao do ponto de bolha
def bolha (T,x):
    P_i = 10**(A-B/(T+C))
    k = P_i/P
    return 1 - k[0]*x[0] - k[1]*x[1]

x = np.linspace(xstart,xfinal,100)

# resolvendo a EDO
L = integ.odeint(distil,L0,x)

plt.plot(x,L)

plt.title('Destilacao em batelada')
plt.xlabel('Fracao molar do tolueno')
plt.ylabel('Mols de liquido remanescentes')
plt.axis([0.40,0.80,10,100])