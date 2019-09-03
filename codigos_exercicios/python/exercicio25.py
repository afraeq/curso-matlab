#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 25
"""

import numpy as np
import scipy.optimize as opt
import matplotlib.pyplot as plt

def colebrook(ed,Re):
    
    if Re<0:
        print('Error! Reynolds number =',Re,'cannot be negative.')
    elif Re<2000:
        f = 64/Re   # laminar flow
        return f
        
    if ed>0.05:
        print('epsilon/diameter ratio =',ed,'is not on Moody chart')
        
#    if Re<4000:
#        print('Re = ',Re,'in transition range')
        
    colefun = lambda f : 1.0/np.sqrt(f) + 2.0*np.log10( ed/3.7 + 2.51/(Re*np.sqrt(f)))
    
    fi = 1.0/(1.8*np.log10(6.9/Re + (ed/3.7)**1.11))**2 # initial guess at f

    dfTol = 5e-6

    f = opt.fsolve(colefun,fi,xtol=dfTol)    
    
    if f<0:
        print('Error! Friction factor',f,'cannot be negative')
        return
    
    return f

# --- Generate a log-spaced vector of Re values in the range 2500 <= Re < 10^8
Re = np.logspace(np.log10(2500),8,50)

ed = np.array([0.0, 0.00005, 0.0002, 0.005, 0.001, 0.005, 0.02])
f = np.zeros_like(Re)

# --- Plot f(Re) curves for one value of epsilon/D at a time

# turbulent flow
for i in range(len(ed)):
    for j in range(len(Re)):
        f[j] = colebrook(ed[i],Re[j])
    plt.loglog(Re,f,'-k')
    
# laminar flow
ReLam = np.array([100,2000])
fLam = 64/ReLam
plt.loglog(ReLam,fLam,'r-')    

# formatting plot

plt.grid(True)
plt.axis([100, 1e8, 5e-3, 2e-1])
plt.xlabel('Re')
plt.ylabel('f').set_rotation(0)

Remax = max(Re)
ReLabel = 8**( np.floor(np.log10(Remax)) - 1.0)

for i in range(2,len(ed)):
    fLabel = colebrook(ed[i],Remax)
    plt.text(ReLabel,1.1*fLabel,'eps/D = %5.4f '%ed[i])