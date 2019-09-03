#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun  5 20:32:35 2017

@author: afranio
"""

import numpy as np
import matplotlib.pyplot as plt
import scipy.optimize as opt

# dados experimentais 
# benzeno - pressao de vapor X temperatura
P = np.array([    1,     5,    10,    20,    40,    60,   100,   200,   400,   760])   # mmHg
T = np.array([-36.7,  -19.6,  -11.5,   -2.6,   7.6,   15.4,   26.1, 42.2,   60.6,   80.1])     # C

# funcao objetivo (minimos quadrados) para a minimizacao
def fit_c(p):
    a = p[0]
    b = p[1]
    c = p[2]
    error  = np.log10(P) - a + b/(T+c)
    return np.sum(error*error)         
            
# chute inicial para os parametros
p0 = np.array([10, 2000, 273])

# minimizacao
p = opt.minimize(fit_c, p0, method='Nelder-Mead').x    

# dominio de T ''continuo'' (para plotar a correlacao)
Tc = np.arange(-37,81.1,0.1)

plt.plot(Tc,(p[0]-p[1]/(Tc+p[2])),'-',T,np.log10(P),'*')

plt.title('Pressao de vapor benzeno - ajustada com a equacao de antoine')
plt.xlabel('T (C)')
plt.ylabel('log10(P)')
