#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun  5 21:05:54 2017

@author: afranio

Adaptado do livro do Eliott e Lira (Introductory Chemical Engineering 
Thermodynamics)
"""

import numpy as np
import scipy.optimize as opt
from thermo.activity import UNIQUAC

# condicoes
TK = 298.15                 # temperatura
z = np.array([0.4, 0.6])    # composicao da alimentacao
nc = z.size                 # numero de componentes

# parametros UNIQUAC
r = np.array([3.4543, 0.92])
q = np.array([3.0520, 1.4])
aij = np.array([[0,-82.688],[443.56,0]])
tau = np.exp(-aij/TK)

# aspectos numericos
errorK = 1.0
tol = 1e-6
count = 0
chute_x = np.array([0.1,0.9])
chute_B = 0.5

# inicializando a matriz de composicao das fases, o vetor de phase split e os gammas
x = np.zeros((nc,2))
B = np.zeros(2)
gamma = np.zeros_like(x)

# estimando composicao da primeira fase
x[:,0] = chute_x
 
 # estimando o phase split
B[0] = chute_B
 
 # calculando a composicao da fase 1 com o balanco material
x[:,1] = (z - B[0]*x[:,0])/(1.0-B[0])
 
# coef de atividade das fases 0 e 1
gamma[:,0] = UNIQUAC(x[:,0],r,q,tau)
gamma[:,1] = UNIQUAC(x[:,1],r,q,tau)

# K das fases 0 e 1
K = gamma[:,0]/gamma[:,1]

# funcao objetivo rashford-rice
def rashford_rice(b):
    return sum(z/(b+K*(1.0-b)))-1.0

# loop principal
while errorK > tol:
        
    # resolvendo a equacao de rashford-rice 
    Bnew = opt.newton(rashford_rice, B[0])
    
    # phase splits
    B[0] = Bnew
    B[1] = 1 - B[0]
    
    # calculando novas composicoes
    x[:,0] = z/(B[0]+K*(1-B[0]))
    x[:,1] = x[:,0]*K
     
    # normalizando composicoes
    x[:,0] = x[:,0]/sum(x[:,0])
    x[:,1] = x[:,1]/sum(x[:,1])

    # calculando novos gamma
    gamma[:,0] = UNIQUAC(x[:,0],r,q,tau)
    gamma[:,1] = UNIQUAC(x[:,1],r,q,tau)
    
    # calculando novos K
    Knew = gamma[:,0]/gamma[:,1]
    
    # calculando dG, a energia de gibbs de mistura
    dG = 0;
    for j in range(2):
        for i in range(0,nc):
            dG += B[j]*x[i,j]*np.log(x[i,j]*gamma[i,j]);
    
    # imprimindo
    print('---------------------------------- %d \n'%count)
    print('x[:,0]: ', x[:,0])
    print('x[:,1]: ', x[:,1])
    print('Beta:   ', B[0])
    print('delta G:', dG)
    
    # calculando variacao em K para determinar convergencia
    errorK = sum(abs(Knew-K)/K)
    K = Knew
    
    # atualizando contador
    count += 1
    
    # sair do loop, se demorar muito   
    if count>10000:
        print('could not converge')
        break

    # sair do loop ,se a alimentacao resultar em apenas uma fase 
    if ((K[0] < 1+tol) and (K[0] > 1-tol)):
        print('feed results in one phase')
        break    