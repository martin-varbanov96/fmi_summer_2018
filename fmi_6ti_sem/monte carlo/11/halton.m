function x = halton(n,s)
  p=primes(s*6);
  p=p(1:s);
  x=[];
  for i = 1:s
    x= [x corput(n, p(i))'];
  end
end  