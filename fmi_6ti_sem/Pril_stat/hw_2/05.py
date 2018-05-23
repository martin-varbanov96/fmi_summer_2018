# -*- coding: utf-8 -*-
from scipy.stats import wilcoxon as wcon
import matplotlib.pyplot as plt
import scipy.stats as stat
import numpy as np

samp_1 = [235, 225, 190, 188]
samp_2 = [180, 169, 180, 185, 178, 183]


plt.hist(samp_1)
plt.hist(samp_2)


data = [samp_1, samp_2]
plt.boxplot(data)


u_test = stat.mannwhitneyu(samp_1, samp_2)
u_test_two_sided = stat.mannwhitneyu(samp_1, samp_2, alternative="two-sided")