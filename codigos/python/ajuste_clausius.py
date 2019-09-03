#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun  5 20:26:17 2017

@author: afranio
"""

import numpy as np
import matplotlib.pyplot as plt

# dados experimentais 
# benzeno - pressao de vapor X temperatura
P = np.array([    1,     5,    10,    20,    40,    60,   100,   200,   400,   760])   # mmHg
T = np.array([-36.7,  -19.6,  -11.5,   -2.6,   7.6,   15.4,   26.1, 42.2,   60.6,   80.1])     # C

# criando as novas variaveis
y = np.log10(P);
x = 1.0/(T+273.15);    
    
# grau do polinomio a ser ajustado (reta!)
n = 1

# ajustar o polinomio
c = np.polyfit(x,y,n)    

# avaliando o polinomio para cada x (comparar com os dados experimentais)
z = np.polyval(c,x)

# dominio de T ''continuo'' (para plotar a correlacao)
xc = np.linspace(x[0],x[-1],50)

plt.plot(xc,c[1]+c[0]*xc,'-',x,y,'*')

plt.title('Pressao de vapor benzeno - ajustada com a equacao de clausius-clapeyron')
plt.xlabel('1/T (K)')
plt.ylabel('log10(P)')
