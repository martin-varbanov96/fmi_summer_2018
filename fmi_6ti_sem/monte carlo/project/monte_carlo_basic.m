function[result] = monte_carlo_basic(fun, a, b, n)
    dim = length(a);
    y = 0;

    for i = 1:n
        x = a + rand(dim, 1) .* (b - a);
        y += fun(x) * prod(b - a) / n;
    end

    result = y;
end