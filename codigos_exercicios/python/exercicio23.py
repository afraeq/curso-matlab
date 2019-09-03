#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 23
"""

import numpy as np
import scipy.optimize as opt

# definindo o sistema
myfun = lambda x : [2*x[0] - x[1] - np.exp(-x[1]), -x[0] + 2*x[1] - np.exp(-x[1])]

# resolvendo
x = opt.fsolve(myfun,[-5,5])
