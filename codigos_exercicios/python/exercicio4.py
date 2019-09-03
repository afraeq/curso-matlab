"""
Exercicio 4
"""

import numpy as np

n = np.arange(1.,101.)

x = ((-1.)**(n+1.))/(2.*n-1.)

y = sum(x)