#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun  5 13:46:03 2017

@author: afranio
"""

import numpy as np
import scipy.integrate as integ
import matplotlib.pyplot as plt

# parametros
D  = 1.0    # difusividade
vz = 1.0    # velocidade
k  = 1.0    # constante de reacao
cf = 1.0    # concentracao da alimentacao

# comprimento do reator
L = 0.5

# numero de pontos em que o dominio sera discretizado (contando as CC)
N = 10

# numero de pontos, excluindo as CC
n = N-2

# comprimento de cada intervalo
deltaL = L/(N-1)

# sistema de equacoes
def pfr(c,t):
    
    # vetor a ser retornado
    dC = np.zeros(n)
    
    # condicoes de contorno
    c0 = ((D/(vz*deltaL))*c[0]+cf)/(1.0+D/(vz*deltaL))
    cNp1 = c[n-1]
    
    # equacoes diferenciais
    
    dC[0] = (D/deltaL**2)*(c[1]-2*c[0]+ c0) - (vz/(2.0*deltaL))*(c[1]-c0) + k*c[0]
    
    for i in range(2,n):
        dC[i-1] = (D/deltaL**2)*(c[i]-2*c[i-1]+ c[i-2]) - (vz/(2.0*deltaL))*(c[i]-c[i-2]) + k*c[i-1]
    
    dC[n-1] = (D/deltaL**2)*(cNp1-2*c[n-1]+ c[n-2]) - (vz/2.0*deltaL)*(cNp1-c[n-2]) + k*c[n-1];
      
    return dC  
      
# condicao inicial
c_inicial =np.zeros(n)

# pontos no tempo
t = np.linspace(0,5,500)

# resolvendo as edos!
C = integ.odeint(pfr,c_inicial,t)
 
# plotando
#plt.plot(t,C)
plt.plot(t,C[:,n-1])

plt.xlabel('t');
plt.ylabel('Cs(t)');
plt.title('Concentracao de saida do PFR');