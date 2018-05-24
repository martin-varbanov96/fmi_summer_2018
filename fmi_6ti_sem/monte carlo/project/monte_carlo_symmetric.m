function[result] = monte_carlo_symmetric(fun, a, b, n)
    dim = length(a);
    y = 0;

    for i = 1:n
        x = a + rand(dim, 1) .* (b - a);
        sigma = b-1
        # taylor() 
        x_positive = x*sigma
        f_positive = fun(0) + polyder(fun(0))*x_positive

        x_negative = x*sigma*(-1)
        f_negative = fun(0) + polyder(fun(0))*x_negative

        y += (fun(x) * prod(b - a) / n) + (fun(x_negative) * prod(b - a) / n);
    end

    result = y;
end