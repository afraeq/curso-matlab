#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 10
"""

import numpy as np
import matplotlib.pyplot as plt 

t = np.arange(0.0,10.1,0.1)

x = - 0.1*t**4 + 0.8*t**3 + 10.*t - 70.
v = - 4.*0.1*t**3 + 0.8*3.*t**2 + 10.
a = -3.*4.*0.1*t**2 + 0.8*3.*2.*t

fig = plt.figure()

subfig1 = fig.add_subplot(3,1,1)
subfig1.plot(t,x)
subfig1.set_ylabel('x')

subfig2 = fig.add_subplot(3,1,2)
subfig2.plot(t,v)
subfig2.set_ylabel('v')

subfig3 = fig.add_subplot(3,1,3)
subfig3.plot(t,a)
subfig3.set_ylabel('a')

subfig3.set_xlabel('t')


