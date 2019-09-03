"""
Exercicio 2
"""

import numpy as np

# item a
A = np.random.rand(2,3)
B = np.random.rand(2,3)

# item b
C = np.random.rand(2,3)+1.
D = np.random.rand(2,3)+1.
                  
# item c
E = A * B
               
# item d
A[:,1] = C[:,0]*C[0,0]                