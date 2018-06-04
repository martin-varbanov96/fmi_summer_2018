from scipy.stats.stats import pearsonr
import math
import scipy.stats as stats
import numpy as np
from sklearn import linear_model 
import pandas as pd
%matplotlib inline
import matplotlib.pyplot as plt

fig = plt.figure()
ax = plt.axes()

x = np.linspace(0, 10, 1000)
ax.plot(x, np.sin(x));
ax.plot(x,5*x+1);