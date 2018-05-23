 function x = corput(n,b)
  m = floor(log(n)/log(b))
  n = 1:n;
  A = [];
  for i = 0:m
    a = rem(n,b);
    n=(n-a)/b;
    A=[A;a];
  end
 x = ((1./b').^(1:(m+1)))*A;