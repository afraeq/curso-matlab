#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 26
"""

import numpy as np
import scipy.integrate as integ
import matplotlib.pyplot as plt

# definindo o sistema
def rigid(y,t):
    return [y[1] * y[2], -y[0] * y[2], -0.51 * y[0] * y[1]]

t = np.arange(0,12.1,0.1)
x0 = [0, 1, 1]

x = integ.odeint(rigid,x0,t) 

plt.plot(t,x)