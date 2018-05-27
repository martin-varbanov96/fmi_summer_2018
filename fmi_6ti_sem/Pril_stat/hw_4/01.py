#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue May 22 13:30:08 2018

@author: martin
"""
from scipy.stats.stats import pearsonr
import math
import scipy.stats as stats
import numpy as np


def calc_m(sum_x, sum_y, sum_xy, sum_x_sq):
    return (sum_y*sum_x - sum_xy ) / ( sum_x*sum_x - sum_x_sq ) 

def get_reg_result(x):
        return 32.14-14.54*x

def calc_error(y, y_, size_data, single_est=False):
    a = (y-y_)**2
    if single_est:
        size_data = size_data - 2
    return math.sqrt(a/size_data)

#Calcucate sum of squares
def sum_sq_w(x):
    SSW = 0
    for el in x:
        SSW += (el-x.mean())**2
    return SSW 


galons = np.array([10, 6, 5, 12, 10, 15, 5, 12, 17, 20])
usd = np.array([1.3, 2, 1.7, 1.5, 1.6, 1.2, 1.6, 1.4, 1, 1.1])

pearsonr(galons, usd)

sum_y =0
sum_x = 0
sum_xy = 0
sum_x_sq = 0
sum_y_sq = 0
for galon, price in zip(galons, usd):
    sum_y += galon
    sum_x += price
    sum_xy += price*galon
    sum_x_sq += price*price 
    sum_y_sq += galon*galon

size_data = len(galons)
cor = (size_data *sum_xy - (sum_x*sum_y))/ math.sqrt( (size_data*sum_x_sq - (sum_x*sum_x)) * (size_data*sum_y_sq - (sum_y*sum_y)) )
calc_m(7/3, 2, 16.3, 7)

predicted_values = []
for el in usd:
    predicted_values.append(round(get_reg_result(el),4))
predicted_values = np.array(predicted_values)

preducted_values_sum = 0
for el in predicted_values:
    preducted_values_sum += el
    
sumed_differences = 0
error_array = []
for i in range(0, len(predicted_values)):
    sumed_differences += (predicted_values[i]-galons[i])**2
    error_array.append(calc_error(predicted_values[i], galons[i], size_data, single_est=True))
sigma_regresion = math.sqrt(sumed_differences/size_data)
error_array = np.array(error_array)

#Get total mean
total_mean = 0
total_points = 0
for el, el_ in zip(error_array, predicted_values):
    total_points += 2
    total_mean += el + el_
total_mean = total_mean / total_points

# CACL SST
SST = 0
for el, el_ in zip(error_array, predicted_values):
    SST += (el-total_mean)**2 + (el_-total_mean)**2 

stats.f_oneway(error_array, predicted_values)


### test single pred error ###

#error_single_est - sigma for out population
error_single_est = 0
for el, el_ in zip(predicted_values, galons):
    error_single_est += (el-el_)**2
error_single_est = math.sqrt(error_single_est/8)    

x = 1.63
SE = 0
for el in usd:
    SE += (el-usd.mean())**2
SE = math.sqrt((1/10) + 1 + ((x-usd.mean())**2/SE))
SE = SE * error_single_est

# calc denominator (xi-x.mean)**2
denominator_error = 0 
for el in usd:
    denominator_error += (el - usd.mean())**2
    
error_array = []
for i in range(0, len(usd)):
    tmp_sq_err = (usd[i] - usd.mean())**2
    tmp_comp = math.sqrt(1 + (1/10) + (tmp_sq_err/denominator_error) )
    error_array.append(error_single_est * tmp_comp)
error_array = np.array(error_array)


#SSE
SSE = 0
for el, el_ in zip(galons, predicted_values):
    SSE += (el-el_)**2
    print(el)
    print(el_)
    