# numerical calculation
[q, ier, nfun, err] = quad ("f_exp", 0, 1)

# points for integration
number_points = [10, 100, 500, 1000, 5000, 10000]

#real_result 
real_result = exp(1) - exp(0)

int_basic_monte_carlo = []
err_basic_monte_carlo = []
for i = 1:length(number_points )
  int_basic_monte_carlo(i) = monte_carlo_basic(@(x) f_exp(x), 0, 1, number_points(i))
  err_basic_monte_carlo(i) = abs(real_result - int_basic_monte_carlo(i))
end

qucu_integrals = []
err_qucu = []
for i = 1:length(number_points )
  qucu_integrals(i) = qucu(@(x) f_exp(x), 0, 1, number_points(i));
end
err_qucu = abs(real_result - qucu_integrals)

int_symmetric_monte_carlo = []
err_symmetric_monte_carlo = []
for i = 1:length(number_points )
  int_symmetric_monte_carlo(i) = monte_carlo_symmetric(@(x) f_exp(x), 0, 1, number_points(i))
  err_symmetric_monte_carlo(i) = abs(real_result - int_symmtric_monte_carlo(i))
end


axis_size = [100, 10000, 0, 0.06]
plot(number_points, err_basic_monte_carlo, 'r')
axis(axis_size)
hold on
plot(number_points, err_qucu, 'g')
legend("monte carlo basic", "qucu monte carlo")
xlabel("Num of points")
ylabel("Error of algorithm")

