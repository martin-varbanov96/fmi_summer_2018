import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as stat

alpha = 0.2
data = [0, 0, 0, 0, 0, 0, 1, 0, 1, 0]


data_A_tmp = [0, 0, 0, 0, 0, 0, 0, 1]
data_A = [0, 0, 0, 0, 0, 0, 0, 0]
data_B = [1, 1]

stat.describe(data)

np.percentile(data, 75)
#data visualization
plt.plot(data)
plt.hist(data)
plt.boxplot(data)

#test normality
from scipy.stats import shapiro
shapiro(data)

stat.mannwhitneyu(data_A, data_B)