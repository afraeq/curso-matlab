#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 15
"""

import numpy as np
import matplotlib.pyplot as plt 

fig = plt.figure()

t1 = np.arange(-9.0,10.0,3)
y1 = np.empty_like(t1)

for i in range(len(t1)):
    if t1[i] >=0:
        y1[i] = -3.0*t1[i]**2 + 5.0
    else:
        y1[i] =  3.0*t1[i]**2 + 5.0   

subfig1 = fig.add_subplot(2,1,1)
subfig1.plot(t1,y1)

t2 = np.arange(-9.0,10.0,0.1)
y2 = np.empty_like(t2)

for i in range(len(t2)):
    if t2[i] >=0:
        y2[i] = -3.0*t2[i]**2 + 5.0
    else:
        y2[i] =  3.0*t2[i]**2 + 5.0   
          
subfig2 = fig.add_subplot(2,1,2)
subfig2.plot(t2,y2)