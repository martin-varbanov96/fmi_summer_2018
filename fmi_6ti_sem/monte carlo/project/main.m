# numerical calculation
r_from = 0
r_to = 1

theta_from = 0
theta_to = pi/4

psi_from = 0
psi_to = 2*pi

r_int_numerical =  quad ("func_r", r_from, r_to)
theta_int_numerical  = quad ("func_theta", theta_from, theta_to)
psi_int_numerical = quad ("func_psi", psi_from, psi_to)

r_int_numerical*theta_int_numerical*psi_int_numerical

#Intervals to compute
number_points = [10, 100, 500, 1000, 5000, 10000]

# real result
real_result_total = pi/10
real_result_r = 1/5
real_result_theta = 1/4
real_result_psi = 2*pi


# basic monte carlo computations
int_r_basic_monte_carlo = []
err_r_basic_monte_carlo = []
int_theta_basic_monte_carlo = []
err_theta_basic_monte_carlo = []
int_psi_basic_monte_carlo = []
err_psi_basic_monte_carlo = []
int_total_basic_monte_carlo = []
err_total_basic_monte_carlo = []
for i = 1:length(number_points)

  # computation r integral
  int_r_basic_monte_carlo(i) = monte_carlo_basic(@(x) func_r(x), r_from, r_to, number_points(i))
  err_r_basic_monte_carlo(i) = abs(real_result_r - int_r_basic_monte_carlo(i))
  
  # computation theta integral
  int_theta_basic_monte_carlo(i) = monte_carlo_basic(@(x) func_theta(x), theta_from, theta_to, number_points(i))
  err_theta_basic_monte_carlo(i) = abs(real_result_theta - int_theta_basic_monte_carlo(i))

  # computing psi integral
  int_psi_basic_monte_carlo(i) = monte_carlo_basic(@(x) func_psi(x), psi_from, psi_to, number_points(i))
  err_psi_basic_monte_carlo(i) = abs(real_result_psi - int_psi_basic_monte_carlo(i))

  # computing total integral
  int_total_basic_monte_carlo(i) = int_r_basic_monte_carlo(i)*int_theta_basic_monte_carlo(i)*int_psi_basic_monte_carlo(i)
  err_total_basic_monte_carlo(i) = abs(real_result_total-int_total_basic_monte_carlo(i))

end



# basic monte carlo computations
int_r_basic_monte_carlo = []
err_r_basic_monte_carlo = []
int_theta_basic_monte_carlo = []
err_theta_basic_monte_carlo = []
int_psi_basic_monte_carlo = []
err_psi_basic_monte_carlo = []
int_total_basic_monte_carlo = []
err_total_basic_monte_carlo = []
for i = 1:length(number_points)

  # computation r integral
  int_r_basic_monte_carlo(i) = monte_carlo_basic(@(x) func_r(x), r_from, r_to, number_points(i))
  err_r_basic_monte_carlo(i) = abs(real_result_r - int_r_basic_monte_carlo(i))
  
  # computation theta integral
  int_theta_basic_monte_carlo(i) = monte_carlo_basic(@(x) func_theta(x), theta_from, theta_to, number_points(i))
  err_theta_basic_monte_carlo(i) = abs(real_result_theta - int_theta_basic_monte_carlo(i))

  # computing psi integral
  int_psi_basic_monte_carlo(i) = monte_carlo_basic(@(x) func_psi(x), psi_from, psi_to, number_points(i))
  err_psi_basic_monte_carlo(i) = abs(real_result_psi - int_psi_basic_monte_carlo(i))

  # computing total integral
  int_total_basic_monte_carlo(i) = int_r_basic_monte_carlo(i)*int_theta_basic_monte_carlo(i)*int_psi_basic_monte_carlo(i)
  err_total_basic_monte_carlo(i) = abs(real_result_total-int_total_basic_monte_carlo(i))

end

#Computing monte carlo with quasy random numbers
int_r_qucu_monte_carlo = []
err_r_qucu_monte_carlo = []
int_theta_qucu_monte_carlo = []
err_theta_qucu_monte_carlo = []
int_psi_qucu_monte_carlo = []
err_psi_qucu_monte_carlo = []
int_total_qucu_monte_carlo = []
err_total_qucu_monte_carlo = []
for i = 1:length(number_points)

  # computation r integral
  int_r_qucu_monte_carlo(i) = qucu(@(x) func_r(x), r_from, r_to, number_points(i))
  err_r_qucu_monte_carlo(i) = abs(real_result_r - int_r_qucu_monte_carlo(i))
  
  # computation theta integral
  int_theta_qucu_monte_carlo(i) = qucu(@(x) func_theta(x), theta_from, theta_to, number_points(i))
  err_theta_qucu_monte_carlo(i) = abs(real_result_theta - int_theta_qucu_monte_carlo(i))

  # computing psi integral
  int_psi_qucu_monte_carlo(i) = qucu(@(x) func_psi(x), psi_from, psi_to, number_points(i))
  err_psi_qucu_monte_carlo(i) = abs(real_result_psi - int_psi_qucu_monte_carlo(i))

  # computing total integral
  int_total_qucu_monte_carlo(i) = int_r_qucu_monte_carlo(i)*int_theta_qucu_monte_carlo(i)*int_psi_qucu_monte_carlo(i)
  err_total_qucu_monte_carlo(i) = abs(real_result_total-int_total_qucu_monte_carlo(i))
end

# TODO:: Symetric method
#Computing monte carlo with quasy random numbers
int_r_symmetric_monte_carlo = []
err_r_symmetric_monte_carlo = []
int_theta_symmetric_monte_carlo = []
err_theta_symmetric_monte_carlo = []
int_psi_symmetric_monte_carlo = []
err_psi_symmetric_monte_carlo = []
int_total_symmetric_monte_carlo = []
err_total_symmetric_monte_carlo = []
for i = 1:length(number_points)

  # computation r integral
  int_r_symmetric_monte_carlo(i) = symmetric(@(x) func_r(x), r_from, r_to, number_points(i))
  err_r_qucu_monte_carlo(i) = abs(real_result_r - int_r_qucu_monte_carlo(i))
  
  # computation theta integral
  int_theta_qucu_monte_carlo(i) = qucu(@(x) func_theta(x), theta_from, theta_to, number_points(i))
  err_theta_qucu_monte_carlo(i) = abs(real_result_theta - int_theta_qucu_monte_carlo(i))

  # computing psi integral
  int_psi_qucu_monte_carlo(i) = qucu(@(x) func_psi(x), psi_from, psi_to, number_points(i))
  err_psi_qucu_monte_carlo(i) = abs(real_result_psi - int_psi_qucu_monte_carlo(i))

  # computing total integral
  int_total_qucu_monte_carlo(i) = int_r_qucu_monte_carlo(i)*int_theta_qucu_monte_carlo(i)*int_psi_qucu_monte_carlo(i)
  err_total_qucu_monte_carlo(i) = abs(real_result_total-int_total_qucu_monte_carlo(i))

end

# FIX SYMMETRIC COMPUTATIONS
# symmetric monte carlo computations
int_r_symmetric_monte_carlo = []
err_r_symmetric_monte_carlo = []
int_theta_symmetric_monte_carlo = []
err_theta_symmetric_monte_carlo = []
int_psi_symmetric_monte_carlo = []
err_psi_symmetric_monte_carlo = []
int_total_symmetric_monte_carlo = []
err_total_symmetric_monte_carlo = []
for i = 1:length(number_points)

  # computation r integral
  int_r_symmetric_monte_carlo(i) = monte_carlo_symmetric(@(x) func_r(x), r_from, r_to, number_points(i))
  err_r_symmetric_monte_carlo(i) = abs(real_result_r - int_r_symmetric_monte_carlo(i))
  
  # computation theta integral
  int_theta_symmetric_monte_carlo(i) = monte_carlo_symmetric(@(x) func_theta(x), theta_from, theta_to, number_points(i))
  err_theta_symmetric_monte_carlo(i) = abs(real_result_theta - int_theta_symmetric_monte_carlo(i))

  # computing psi integral
  int_psi_symmetric_monte_carlo(i) = monte_carlo_symmetric(@(x) func_psi(x), psi_from, psi_to, number_points(i))
  err_psi_symmetric_monte_carlo(i) = abs(real_result_psi - int_psi_symmetric_monte_carlo(i))

  # computing total integral
  int_total_symmetric_monte_carlo(i) = int_r_symmetric_monte_carlo(i)*int_theta_symmetric_monte_carlo(i)*int_psi_symmetric_monte_carlo(i)
  err_total_symmetric_monte_carlo(i) = abs(real_result_total-int_total_symmetric_monte_carlo(i))

end


axis_size = [100, 10000, 0, 0.5]
plot(number_points, err_total_basic_monte_carlo, 'r')
axis(axis_size)
hold on
plot(number_points, err_total_qucu_monte_carlo, 'g')
hold on
plot(number_points, err_total_symmetric_monte_carlo, 'b')
legend("monte carlo basic", "qucu monte carlo")
xlabel("Num of points")
ylabel("Error of algorithm")
