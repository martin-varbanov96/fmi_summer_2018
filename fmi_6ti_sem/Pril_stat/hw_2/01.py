#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed May  9 09:18:24 2018

@author: martin
"""
import numpy as np
import matplotlib.pyplot as plt

sample_1 = [75.0, 69.8, 85.7, 74.0, 69.0, 83.3, 68.9, 77.8, 72.2, 77.4]
sample_2 = [85.4, 83.1, 80.2, 74.5, 70.0, 81.5, 75.4, 79.2, 85.4, 80.4] 

from scipy.stats import kstest, ks_2samp
ks_2samp(sample_1, sample_2)

from scipy.stats import chi2_contingency
obs = np.array([sample_1, sample_2])
stat, pval, factor, arr = chi2_contingency(obs)


obs_theory = np.array([sample_1, sample_1])
chi2_contingency(obs_theory)

plt.figure()
data = [sample_1, sample_2]
plt.boxplot(data)
plt.plot()

plt.hist(data)

from scipy.stats import shapiro
shapiro(sample_1)
shapiro(sample_2)