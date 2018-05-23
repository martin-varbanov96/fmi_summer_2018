#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue May 22 13:30:08 2018

@author: martin
"""
from scipy.stats.stats import pearsonr
import math


def calc_m(sum_x, sum_y, sum_xy, sum_x_sq):
    return (sum_y*sum_x - sum_xy ) / ( sum_x*sum_x - sum_x_sq ) 

galons = [10, 6, 5, 12, 10, 15, 5, 12, 17, 20]
usd = [1.3, 2, 1.7, 1.5, 1.6, 1.2, 1.6, 1.4, 1, 1.1]

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