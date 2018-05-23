# numerical calculation
[q, ier, nfun, err] = quad ("f_1", 0, pi/2)

real_result = 1
number_points = [10, 100, 500, 1000, 5000, 10000]

int_basic_monte_carlo = []
err_basic_monte_carlo = []
for i = 1:length(number_points )
  int_basic_monte_carlo(i) = monte_carlo_basic(@(x) f_1(x), 0, pi/2, number_points(i))
  err_basic_monte_carlo(i) = abs(real_result - int_basic_monte_carlo(i))
end

qucu_integrals = []
err_qucu = []
for i = 1:length(number_points )
  qucu_integrals(i) = qucu(@(x) f_1(x), 0, pi/2, number_points(i));
end
err_qucu = abs(real_result - qucu_integrals)

plot(number_points, err_basic_monte_carlo, 'r')
hold on
plot(number_points, err_qucu, 'g')
legend("monte carlo basic", "qucu monte carlo")
xlabel("Num of points")
ylabel("Error of algorithm")

