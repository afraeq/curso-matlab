#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 9
"""

import numpy as np
import matplotlib.pyplot as plt 

t = np.arange(1970.,2001.)

termo = 1. + np.exp(-0.0313*(t-1913.25))
P = 197273000./termo;

plt.plot(t,P)
plt.xlabel('ano'), plt.ylabel('populacao')

P2020 = 197273000./(1. + np.exp(-0.0313*(2020. - 1913.25)))