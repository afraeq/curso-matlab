#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Exercicio 14
"""

s = 0;    # soma atual
i = 0;    # numero atual que estamos somando

while s<1000000:
    i+=1
    s+=i

print('\nA soma de 1 + 2 + ... +',i,'eh igual a',s)