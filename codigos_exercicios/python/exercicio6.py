"""
Exercicio 6
"""

import numpy as np

# definindo a matriz 9x9

A1 = np.arange(1.,10.)
A2 = np.arange(10.,19.)
A3 = np.arange(19.,28.)
A4 = np.arange(28.,37.)
A5 = np.arange(37.,46.)
A6 = np.arange(46.,55.)
A7 = np.arange(55.,64.)
A8 = np.arange(64.,73.)
A9 = np.arange(73.,82.)

A = np.vstack([A1,A2,A3,A4,A5,A6,A7,A8,A9])

# METODO CONVENCIONAL

# guardando as submatrizes 1 e 3 nas variaveis auxiliares aux
#aux1 = A[0:3,0:3].copy()
#aux3 = A[6:9,6:9].copy()

# trocando a submatriz 1 pela 3 e vice-versa
#A[0:3,0:3] = aux3
#A[6:9,6:9] = aux1

# guardando a submatriz 2 e 4 nas variaveis auxiliares aux
#aux2 = A[0:3,6:9].copy()
#aux4 = A[6:9,0:3].copy()

# trocando a submatriz 2 pela 4 e vice-versa
#A[0:3,6:9] = aux4
#A[6:9,0:3] = aux2
 
# METODO "PYTHONICO"
A[0:3,0:3], A[6:9,6:9] = A[6:9,6:9].copy(), A[0:3,0:3].copy() 
A[0:3,6:9], A[6:9,0:3] = A[6:9,0:3].copy(), A[0:3,6:9].copy()
   

