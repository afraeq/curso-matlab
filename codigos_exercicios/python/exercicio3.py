"""
Exercicio 3
"""

import numpy as np

x = np.arange(1.,10.5,0.5)

# item a
a = x + x[2]

# item b
b = x[ ::2]*3.
     
# item c
c = np.sqrt(x[1::2])     