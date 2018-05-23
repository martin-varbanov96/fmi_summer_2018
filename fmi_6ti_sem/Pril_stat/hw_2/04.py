# -*- coding: utf-8 -*-

from scipy.stats import wilcoxon as wcon
import matplotlib.pyplot as plt
import scipy.stats as stat
import numpy as np

n = 15
m = [22, 37, 36, 38, 42, 58, 58, 60, 62, 65, 66, 56, 66, 67, 62]
sub_m = [22, 37, 36, 38, 42, 58, 58, 60, 62, 65, 66, 56, 66, 67, 63]
u = [53, 68, 42, 49, 51, 65, 51, 71, 55, 74, 68, 64, 67, 73, 65]

#plot data
data = [m, u]
plt.boxplot(data)

# get mean value
stat.describe(m)
stat.describe(u)

# test with self
wilcoxon_test = wcon(m, sub_m)

wilcoxon_test = wcon(m, u)