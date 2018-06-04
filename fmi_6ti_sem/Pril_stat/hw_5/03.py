from scipy.stats.stats import pearsonr
import math
import scipy.stats as stats
import numpy as np
from sklearn import linear_model 
import pandas as pd
%matplotlib inline
import matplotlib.pyplot as plt

raw_data = [37, 36.25, 35.41, 34.91, 34.52, 34.45, 34.4, 34, 33.62, 33.9]
raw_data_size = len(raw_data)

place_data = np.array([i for i in range(1,raw_data_size+1)])
working_data = np.array(raw_data)

# plt.plot(place_data, working_data)


#Lin Model
model = linear_model.LinearRegression()
place_data = place_data.reshape(-1,1)
model.fit(place_data, working_data)



#visualization
fig = plt.figure()
ax = plt.axes()
x = np.linspace(0, 10, 1000)
b = model.intercept_
a = model.coef_[0]
ax.plot(place_data, working_data);
ax.plot(place_data, a*place_data+b);

#LSM
Y = np.array([np.log(i) for i in raw_data])
xY = np.array([ el_1 * el_2 for el_1, el_2 in zip(place_data, Y)])
xx = np.array([el**2 for el in place_data])
x = place_data

B = ( (x.sum()*xY.sum()) - (Y.sum()*xx.sum()) ) / ( (x.sum()*x.sum()) - (xx.sum()*raw_data_size) )
A = ( Y.sum() - (raw_data_size*B) ) / x.sum() 

a0 = np.exp(B)
a1 = np.exp(A*(-1))

result = [a1*np.exp(a0*el*(-1)) for el in place_data]
