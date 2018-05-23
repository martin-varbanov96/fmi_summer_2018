function y = qucu(fname, a, b, N)
  dim = length(a);
  s=0;
  r= halton(N,dim)
  for i = 1:N
    x = a+ (b-a).* r(i, :)
    s = s + feval(fname,x) * prod(b-a);
  end
y= s/N
