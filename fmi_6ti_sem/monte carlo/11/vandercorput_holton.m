function[result] = integrate(fun, a, b, n)
    dim = length(a);
    y = 0;

    for i = 1:n
        x = a + rand(dim, 1) .* (b - a);
        y += fun(x) * prod(b - a) / n;
    end

    result = y;
end

function y = qucu(fname, a, b, N)
  dim = length(a);
  s=0;
  r= halton(N,dim)
  for i = 1:N
    x = a+ (b-a).* r(i, dim)
  end
  
  s = s + feval(fname,x) * 
  
 
 function x = corput(u,b)
  m = floor(log(n)/log(b))
  n = 1:n;
  A = [];
  for i = 0:m
    a = rem(u,b);
    u=(u-a)/b;
    A=[A;a];
  end
 
 x = corput(15,2)
  
 function x = halton(n,S)
 p=primes(s*b);
 p=p(1:s);
 x=[];
 for i = 1:s
  x= [x corpit]