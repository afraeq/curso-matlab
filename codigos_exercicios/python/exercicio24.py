#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 24
"""

import numpy as np
import scipy.optimize as opt

# definindo a equação
def myfun(x):
    X = np.array([[x[0],x[1]],[x[2],x[3]]])
    prod = np.matmul(X,np.matmul(X,X))
    dif = prod - np.array([[1,2],[3,4]])
    return [dif[0,0],dif[0,1],dif[1,0],dif[1,1]]

# chute inicial
x0 = np.ones(4)

# resolvendo
x = opt.fsolve(myfun,x0)