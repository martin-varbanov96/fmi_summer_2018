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
number_points = [10, 100, 500, 1000, 5000, 10000];

# real result
real_result_total = pi/10;
real_result_r = 1/5;
real_result_theta = 1/4;
real_result_psi = 2*pi;

len_iterations = 100
size_points = length(number_points);
basic_monte_carlo_arr = zeros(1,size_points);
quasi_monte_carlo_arr = zeros(1,size_points);
symmetric_monte_carlo_arr = zeros(1,size_points);
err_basic_monte_carlo_arr = zeros(1,size_points);
err_quasi_monte_carlo_arr = zeros(1,size_points);
err_symmetric_monte_carlo_arr = zeros(1,size_points);
for iter = 1:len_iterations

  # basic monte carlo computations
  int_r_basic_monte_carlo = [];
  err_r_basic_monte_carlo = [];
  int_theta_basic_monte_carlo = [];
  err_theta_basic_monte_carlo = [];
  int_psi_basic_monte_carlo = [];
  err_psi_basic_monte_carlo = [];
  int_total_basic_monte_carlo = [];
  err_total_basic_monte_carlo = [];
  for i = 1:length(number_points)

    # computation r integral
    int_r_basic_monte_carlo(i) = monte_carlo_basic(@(x) func_r(x), r_from, r_to, number_points(i));
    err_r_basic_monte_carlo(i) = abs(real_result_r - int_r_basic_monte_carlo(i));
    
    # computation theta integral
    int_theta_basic_monte_carlo(i) = monte_carlo_basic(@(x) func_theta(x), theta_from, theta_to, number_points(i));
    err_theta_basic_monte_carlo(i) = abs(real_result_theta - int_theta_basic_monte_carlo(i));

    # computing psi integral
    int_psi_basic_monte_carlo(i) = monte_carlo_basic(@(x) func_psi(x), psi_from, psi_to, number_points(i));
    err_psi_basic_monte_carlo(i) = abs(real_result_psi - int_psi_basic_monte_carlo(i));

    # computing total integral
    int_total_basic_monte_carlo(i) = int_r_basic_monte_carlo(i)*int_theta_basic_monte_carlo(i)*int_psi_basic_monte_carlo(i);
    err_total_basic_monte_carlo(i) = abs(real_result_total-int_total_basic_monte_carlo(i));

  end
  
  #Append result to array
  for el_iter = 1:length(int_total_basic_monte_carlo)
    basic_monte_carlo_arr(el_iter) = int_total_basic_monte_carlo(el_iter) + basic_monte_carlo_arr(el_iter);
    err_basic_monte_carlo_arr(el_iter) = err_basic_monte_carlo_arr(el_iter) + err_total_basic_monte_carlo(el_iter);
  end

  
  #Computing monte carlo with quasy random numbers
  int_r_qucu_monte_carlo = [];
  err_r_qucu_monte_carlo = [];
  int_theta_qucu_monte_carlo = [];
  err_theta_qucu_monte_carlo = [];
  int_psi_qucu_monte_carlo = [];
  err_psi_qucu_monte_carlo = [];
  int_total_qucu_monte_carlo = [];
  err_total_qucu_monte_carlo = [];
  for i = 1:length(number_points)

    # computation r integral
    int_r_qucu_monte_carlo(i) = qucu(@(x) func_r(x), r_from, r_to, number_points(i));
    err_r_qucu_monte_carlo(i) = abs(real_result_r - int_r_qucu_monte_carlo(i));
    
    # computation theta integral
    int_theta_qucu_monte_carlo(i) = qucu(@(x) func_theta(x), theta_from, theta_to, number_points(i));
    err_theta_qucu_monte_carlo(i) = abs(real_result_theta - int_theta_qucu_monte_carlo(i));

    # computing psi integral
    int_psi_qucu_monte_carlo(i) = qucu(@(x) func_psi(x), psi_from, psi_to, number_points(i));
    err_psi_qucu_monte_carlo(i) = abs(real_result_psi - int_psi_qucu_monte_carlo(i));

    # computing total integral
    int_total_qucu_monte_carlo(i) = int_r_qucu_monte_carlo(i)*int_theta_qucu_monte_carlo(i)*int_psi_qucu_monte_carlo(i);
    err_total_qucu_monte_carlo(i) = abs(real_result_total-int_total_qucu_monte_carlo(i));
  end

  #Appending quasi result
  for el_iter = 1:length(int_total_basic_monte_carlo)
    quasi_monte_carlo_arr(el_iter) = int_total_qucu_monte_carlo(el_iter) + quasi_monte_carlo_arr(el_iter);
    err_quasi_monte_carlo_arr(el_iter) = err_quasi_monte_carlo_arr(el_iter) + err_total_qucu_monte_carlo(el_iter);
  end

  
  # symmetric monte carlo computations
  int_r_symmetric_monte_carlo = [];
  err_r_symmetric_monte_carlo = [];
  int_theta_symmetric_monte_carlo = [];
  err_theta_symmetric_monte_carlo = [];
  int_psi_symmetric_monte_carlo = [];
  err_psi_symmetric_monte_carlo = [];
  int_total_symmetric_monte_carlo = [];
  err_total_symmetric_monte_carlo = [];
  for i = 1:length(number_points)

    # computation r integral
    int_r_symmetric_monte_carlo(i) = symmetric_mcm(@(x) func_r(x), r_from, r_to, number_points(i));
    err_r_symmetric_monte_carlo(i) = abs(real_result_r - int_r_symmetric_monte_carlo(i));
    
    # computation theta integral
    int_theta_symmetric_monte_carlo(i) = symmetric_mcm(@(x) func_theta(x), theta_from, theta_to, number_points(i));
    err_theta_symmetric_monte_carlo(i) = abs(real_result_theta - int_theta_symmetric_monte_carlo(i));

    # computing psi integral
    int_psi_symmetric_monte_carlo(i) = symmetric_mcm(@(x) func_psi(x), psi_from, psi_to, number_points(i));
    err_psi_symmetric_monte_carlo(i) = abs(real_result_psi - int_psi_symmetric_monte_carlo(i));

    # computing total integral
    int_total_symmetric_monte_carlo(i) = int_r_symmetric_monte_carlo(i)*int_theta_symmetric_monte_carlo(i)*int_psi_symmetric_monte_carlo(i);
    err_total_symmetric_monte_carlo(i) = abs(real_result_total-int_total_symmetric_monte_carlo(i));

  end
  
  #Append result to array
  for el_iter = 1:length(int_total_basic_monte_carlo)
    symmetric_monte_carlo_arr(el_iter) = int_total_symmetric_monte_carlo(el_iter) + symmetric_monte_carlo_arr(el_iter);
    err_symmetric_monte_carlo_arr(el_iter) = err_symmetric_monte_carlo_arr(el_iter) + err_total_symmetric_monte_carlo(el_iter);
  end

end

#get avg values
basic_monte_carlo_arr = basic_monte_carlo_arr/len_iterations;
quasi_monte_carlo_arr = quasi_monte_carlo_arr/len_iterations;
symmetric_monte_carlo_arr = symmetric_monte_carlo_arr/len_iterations;
err_basic_monte_carlo_arr = err_basic_monte_carlo_arr/len_iterations;
err_quasi_monte_carlo_arr = err_quasi_monte_carlo_arr/len_iterations;
err_symmetric_monte_carlo_arr = err_symmetric_monte_carlo_arr/len_iterations;



axis_size = [100, 10000, 0, 0.05]
plot(number_points, err_basic_monte_carlo_arr, 'r')
axis(axis_size)
hold on
plot(number_points, err_quasi_monte_carlo_arr, 'g')
hold on
plot(number_points, err_symmetric_monte_carlo_arr, 'b')
legend("monte carlo basic", "quasi monte carlo", "symmetric monte carlo")
xlabel("Num of points")
ylabel("Error of algorithm")
print -djpg 05_big_sample.jpg

