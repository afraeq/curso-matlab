#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun  5 20:17:37 2017

@author: afranio
"""

import numpy as np
import matplotlib.pyplot as plt

# dados experimentais 
# benzeno - pressao de vapor X temperatura
P = np.array([    1,     5,    10,    20,    40,    60,   100,   200,   400,   760])   # mmHg
T = np.array([-36.7,  -19.6,  -11.5,   -2.6,   7.6,   15.4,   26.1, 42.2,   60.6,   80.1])     # C

# grau do polinomio a ser ajustado
n = 4

# ajustar o polinomio
c = np.polyfit(T,P,n)    

# avaliando o polinomio para cada T (comparar com os dados experimentais)
z = np.polyval(c,T)

# dominio de T ''continuo'' (para plotar a correlacao)
Tc = np.arange(-37,81.1,0.1)

plt.plot(Tc,c[4]+c[3]*Tc+c[2]*Tc**2+c[1]*Tc**3+c[0]*Tc**4,'-',T,P,'*')

plt.title('Pressao de vapor benzeno - ajustada com polinomio de quarto grau')
plt.xlabel('T (C)')
plt.ylabel('P (mm Hg)')
