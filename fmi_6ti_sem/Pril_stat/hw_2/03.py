# -*- coding: utf-8 -*-

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import scipy.stats as stat
import scipy.stats as binom

#9.4, 10.3
#7.8, 8.9
#5.6, 4.1
#12.1, 14.7
#6.9, 8.7
#4.2, 7.1
#8.8, 11.3
#7.7, 5.2
#6.4, 7.8

sample_1 = [9.4, 7.8, 5.6, 12.1, 6.9, 4.2, 8.8, 7.7, 6.4]
sample_2 = [10.3, 8.9, 4.1, 14.7, 8.7, 7.1, 11.3, 5.2, 7.8]
sample_2_tmp = [10.3, 8.9, 4.876, 14.123, 8.7, 7.123, 11.234, 5.2, 7.123]

plt.hist(sample_1)
plt.hist(sample_2)

sign_test = stat.wilcoxon(sample_1, sample_2)


#test normality
from scipy.stats import shapiro
shapiro(sample_1)
shapiro(sample_2)

# chcking variances for t-test
stat.describe(sample_1)
stat.describe(sample_2)

#make t-test
t_test = stat.ttest_ind(sample_1, sample_2)

degre_freedom = len(sample_1) + len(sample_2) -2
#r_count = 0
#for index, el in enumerate(sample_1):
#    if sample_1[index] - sample_2[index] > 0:
#        r_count +=1
#    elif sample_1[index] - sample_2[index] < 0:
#        r_count -=1
#        
#probab = 1/2
#r_binom = binomial(len(sample_1), probab)
#
#
#total_p = 0
#for k in range(1, r_count  + 1):  # DO NOT FORGET THAT THE LAST INDEX IS NOT USED
#    total_p += r_binom.pmf(k)
