#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 16
"""

import numpy as np

soma = 0.0

# loop
for i in range(1,21):
    for j in range(3,10):
        soma += np.sin(i+j)
        
        