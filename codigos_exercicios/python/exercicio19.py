#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 19
"""

import numpy as np
import matplotlib.pyplot as plt

# definindo a funcao

def newton_rhapson (f,df,x,tol,it_max):
    
    '''
    % Esta funcao implementa o metodo de Newton-Raphson para o calculo da raiz 
    % de uma equacao unidimensional. 
    %
    % Sua sintaxe eh:
    %
    %       (raiz, nit)= newton_rhapson (f, df, x, tol, it_max)
    %
    % Sendo:
    %
    % raiz: resultado
    % nit: numero de iteracoes realizadas
    %
    % f: funcao a ser zerada
    % df: expressao da derivada de f
    % x: estimativa inicial
    % tol: tolerancia no valor da funcao
    % it_max: numero maximo de iteracoes
    '''
    
    for i in range(1,it_max+1):        

        x = x - f(x)/df(x)        

        if(abs(f(x))<=tol):
            raiz = x
            return (raiz, i)  
        
    # acusando erro
    if i == it_max:
        print('\nMetodo de Newton falhou apos',it_max,'iteracoes.\n\n')
            
# testando

f =  lambda x : x**2 + 2*x -1
df = lambda x : 2*x + 2

x = np.arange(-4.1,4.1,0.1)

plt.plot(x,f(x))

plt.axis([-4,4,-2,20])

(result1,nit1) = newton_rhapson(f,df,-2,1e-5,20)
(result2,nit2) = newton_rhapson(f,df,2,1e-5,20)

plt.axhline(y=0,linestyle='--')
plt.axvline(x=result1,linestyle='--')
plt.axvline(x=result2,linestyle='--')