from scipy.stats.stats import pearsonr
import math
import scipy.stats as stats
import numpy as np
from sklearn import linear_model 
import pandas as pd

x0 = np.ones(7)
x1 = np.array([-3, -2, -1, 0, 1, 2, 3])
x2 = np.array([5, 0, -3, -4, -3, 0, 5])
x3 = np.array([-1, 1, 1, 0, -1, -1, 1])
Y = np.array([1, 0, 0, 1, 2, 3, 3])
X = np.array([x0, x1, x2, x3])


# convert from (3,7) -> (7,3)
XT = np.matrix.transpose(X)

#Convert to pandas DataFrame
df = pd.DataFrame(XT)

model = linear_model.LinearRegression()
model.fit(XT, Y)

#Prediction
prediction = np.array([1, 1, -3, -1])
prediction = prediction.reshape(-1,1)
prediction = prediction.reshape(1,-1)
prediction = model.predict(prediction)

XXT = np.matmul(X, XT)
XXT_inv = np.linalg.inv(XXT)

pearsonr(x3, Y)

#Calc Disp
aT = np.array([1, 1, -3, -1])
XTX = XXT_inv
a = np.matrix.transpose(aT)
result = np.matmul(aT,XTX)
result = np.matmul(result,a)

#Calc Expectation
YT = np.matrix.transpose(Y)
Y_hat = np.array([1.428, 0.5, 0.119, -0.5])
tmp_comp = np.matmul(Y_hat, X)
SSE = np.matmul(Y,YT)- np.matmul(tmp_comp, YT)

#Tmp
raw_data = [-2, -1, 0, 1, 2]
x_ones = np.ones(len(raw_data))
x = np.array([x_ones, raw_data])
xT = np.matrix.transpose(x)
xxt = np.matmul(x,xT)
np.linalg.inv(xxt)


###### TESTING
from sklearn import datasets ## imports datasets from scikit-learn
data = datasets.load_boston() ## loads Boston dataset from datasets library
# define the data/predictors as the pre-set feature names  
df = pd.DataFrame(data.data, columns=data.feature_names)

# Put the target (housing value -- MEDV) in another DataFrame
target = pd.DataFrame(data.target, columns=["MEDV"])

X = df
y = target["MEDV"]

import statsmodels.api as sm

# Note the difference in argument order
model = sm.OLS(y, X).fit()
predictions = model.predict(X) # make the predictions by the model

# Print out the statistics
model.summary()