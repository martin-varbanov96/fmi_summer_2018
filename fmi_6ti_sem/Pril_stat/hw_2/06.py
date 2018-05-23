# -*- coding: utf-8 -*-

# D = 0
# N = 1

from scipy.stats import wilcoxon as wcon
import matplotlib.pyplot as plt
import scipy.stats as stat
import numpy as np

arr = [0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0,
       0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0
       ]


stat.wilcoxon(arr)