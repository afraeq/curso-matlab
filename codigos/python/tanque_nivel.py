#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun  5 19:41:50 2017

@author: afranio
"""

import numpy as np
import scipy.integrate as integ
import matplotlib.pyplot as plt

# parametros
alfa = 1.0
beta = 0.5

# modelos

def linear(h,t):
    return -((beta**2)/(2*alfa))*(h-alfa**2/beta**2)
    
def nao_linear(h,t):
    return alfa -beta*np.sqrt(h)

# plotando dh/dt X h

plt.figure(0);

h = np.arange(0,20.1,0.1)

plt.plot(h,linear(h,0))
plt.plot(h,nao_linear(h,0))

plt.xlabel('h');
plt.ylabel('d(h(t))/dt');
plt.legend(['linear','nao-linear']);
         
# resolvendo as edo's dos dois modelos com duas diferentes cond. iniciais

hinicial_1 = 0
hinicial_2 = 10
t = np.arange(0.0,50.1,0.1)

h1 = integ.odeint(linear,hinicial_1,t)
h2 = integ.odeint(nao_linear,hinicial_1,t)
h3 = integ.odeint(linear,hinicial_2,t)
h4 = integ.odeint(nao_linear,hinicial_2,t)

# plotando as quatro solucoes

plt.figure(1)

plt.plot(t,h1,t,h2,t,h3,t,h4)

plt.xlabel('t');
plt.ylabel('h(t)');