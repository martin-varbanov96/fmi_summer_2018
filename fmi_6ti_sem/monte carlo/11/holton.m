function x = halton(n,S)
  p=primes(s*b);
  p=p(1:s);
  x=[];
  for i = 1:s
    x= [x corput(n, p(i))'];
  end