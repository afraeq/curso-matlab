#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 21
"""

import numpy as np
import matplotlib.pyplot as plt

def pressure (x):
    P = (x * np.exp(0.458*(1.0-x)**2) * 0.243) + ((1.0-x) * np.exp(0.458*x**2) * 0.241)
    return P

def comp_vap (x):
    y = (x * np.exp(0.458*(1.0-x)**2) * 0.243) / (x * np.exp(0.458*(1.0-x)**2)*0.243 + (1.0-x)*np.exp(0.458*x**2)*0.241)
    return y

x = np.arange(0,1.01,0.01)

plt.plot(x,pressure(x))
plt.plot(comp_vap(x),pressure(x),'-r')

plt.title('Diagrama Pxy - Ciclohexano e benzeno, 40$^{\circ}$C');
plt.xlabel('x1,y1');
plt.ylabel('P (atm)');
plt.legend(['x1','x2']);
plt.axis([0,1, 0.240, 0.272])
plt.grid(True);