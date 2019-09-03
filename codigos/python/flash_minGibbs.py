#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jun  6 01:47:29 2017

@author: afranio
"""

import numpy as np
import scipy.optimize as opt
from thermo.activity import UNIQUAC
import matplotlib.pyplot as plt
from matplotlib import cm
from mpl_toolkits.mplot3d import Axes3D
#%matplotlib inline

# condicoes
TK = 298.15                 # temperatura
z = np.array([0.4, 0.6])    # composicao da alimentacao
nc = z.size                 # numero de componentes
nf = 2                      # numero de fases
n = 1                       # numero de mols total
ni = z*n                    # numeros de mols por componente

# parametros UNIQUAC
r = np.array([3.4543, 0.92])
q = np.array([3.0520, 1.4])
aij = np.array([[0,-82.688],[443.56,0]])
tau = np.exp(-aij/TK)

# preparando arrays que serao usadas na funcao objetivo
nij = np.zeros((nc,nf))
xij = np.zeros((nc,nf-1))
ni_nf = np.zeros(nc)
gamma = np.zeros_like(xij)

# funcao objetivo: energia de gibbs de mistura
def deltaG(nij_vetor):
    
    for j in range(0,nf-1):
        for i in range(0,nc):
            nij[i,j] = nij_vetor[j+i*(nf-1)]
    
    dG = 0
    
    for j in range (0,nf-1):
        for i in range (0,nc):
            xij[i,j] = nij[i,j]/sum(nij[:,j])
        gamma[:,j] = UNIQUAC(xij[:,j],r,q,tau)
        
    for j in range(0,nf-1):
        for i in range(0,nc):
            dG += nij[i,j]*np.log(xij[i,j]*gamma[i,j])/n
                     
    for i in range(0,nc):
        ni_nf[i] = ni[i] - sum(nij[i,:])
        
    xi_nf = ni_nf/sum(ni_nf)
    gamma_nf = UNIQUAC(xi_nf,r,q,tau)
    
    for i in range(0,nc):
        dG += ni_nf[i]*np.log(xi_nf[i]*gamma_nf[i])/n
    
    return dG

# encontrando o estado de equilibrio: minimo global de deltaG
bounds_phase1 = ((1e-50, ni[0]-1e-5), (1e-50, ni[1]-1e-5))
result = opt.differential_evolution(deltaG,bounds_phase1)

# ajustando resultados

dG_min = result.fun

ni_ph1 = result.x
ni_ph2 = ni - ni_ph1

xi_ph1 = ni_ph1/sum(ni_ph1)
xi_ph2 = ni_ph2/sum(ni_ph2)

B = sum(ni_ph1)/n
          
print('x[:,0]: ', xi_ph1[:])
print('x[:,1]: ', xi_ph2[:])
print('Beta:   ', B)
print('delta G:', dG_min)
          
# plotando deltaG e seu minimo global

#https://stackoverflow.com/questions/8722735/i-want-to-use-matplotlib-to-make-a-3d-plot-given-a-z-function

n1_axis = np.linspace(1e-16,ni[0]-1e-5,50)
n2_axis = np.linspace(1e-16,ni[1]-1e-5,50)
        
N1_axis, N2_axis = np.meshgrid(n1_axis, n2_axis)     

zs = np.array([deltaG([n1_axis, n2_axis]) for n1_axis,n2_axis in zip (np.ravel(N1_axis), np.ravel(N2_axis))])
Z = zs.reshape(N1_axis.shape)
        
fig = plt.figure()
ax = fig.gca(projection='3d')
ax.plot_surface(N1_axis, N2_axis, Z, cmap=cm.coolwarm)

ax.set_xlabel('Fase Aquosa')
ax.set_ylabel('Fase Orgânica')
ax.set_zlabel('$\Delta$ G')

# os dois minimos (o primeiro considerando a primeira fase como a organica, 
#o segundo considerando a primeira como aquosa)
ax.scatter(ni_ph1[0], ni_ph1[1], dG_min)
ax.scatter(ni_ph2[0], ni_ph2[1], dG_min)