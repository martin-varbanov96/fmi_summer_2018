A = [1,8,3;3,10,7;5,6,9]

#select 1va kolena
#>> A(1:end,1:1)
#ans =

#   1
  # 3
   #5


#nuleva matrica 2x3
zeros(2,3)


#matrica ot edinici 3x4
ones(3,4)

#edinichna matrica
eye(3)

#subirane na matrici
A+ones(3)

#umnojvane na matrici
A*ones(3)

#umnojavane poelementno
A.*ones(3)



C =

   11   12   13   14
   12   22   23   24
   31   32   33   34
   41   42   43   44

>> diag(C)
ans =

   11
   22
   33
   44
   
 >> diag(C)
ans =

   11
   22
   33
   44

>> diag(C,1)
ans =

   12
   23
   34

>> diag(C,3)
ans =  14
>> diag(C,2)
ans =

   13
   24

>> diag(C,-3)
ans =  41
>>






>> -10*diag(ones(13,1))+diag(ones(12,1),-1)
ans =

  -10    0    0    0    0    0    0    0    0    0    0    0    0
    1  -10    0    0    0    0    0    0    0    0    0    0    0
    0    1  -10    0    0    0    0    0    0    0    0    0    0
    0    0    1  -10    0    0    0    0    0    0    0    0    0
    0    0    0    1  -10    0    0    0    0    0    0    0    0
    0    0    0    0    1  -10    0    0    0    0    0    0    0
    0    0    0    0    0    1  -10    0    0    0    0    0    0
    0    0    0    0    0    0    1  -10    0    0    0    0    0
    0    0    0    0    0    0    0    1  -10    0    0    0    0
    0    0    0    0    0    0    0    0    1  -10    0    0    0
    0    0    0    0    0    0    0    0    0    1  -10    0    0
    0    0    0    0    0    0    0    0    0    0    1  -10    0
    0    0    0    0    0    0    0    0    0    0    0    1  -10

    
    
 


>> diag([1,5,-4])+diag([-1,2],1)+diag(3,2)
ans =

   1  -1   3
   0   5   2
   0   0  -4
   
   
   
   
   
   
>> tril(ones(4,4))+diag(-1,3)
ans =

   1   0   0  -1
   1   1   0   0
   1   1   1   0
   1   1   1   1
   
   
   
   
>> 3*diag(ones(6,1))+ diag(ones(4,1),2)*(-1)+diag(ones(4,1),-2)*(-1)
ans =

   3  -0  -1  -0  -0  -0
  -0   3  -0  -1  -0  -0
  -1  -0   3  -0  -1  -0
  -0  -1  -0   3  -0  -1
  -0  -0  -1  -0   3  -0
  -0  -0  -0  -1  -0   3
  
  
  #Transponirana matrica
  transpose(A)
  
  
  #obratna
  inv(A)
  
  
  
  >> c=[1,1,-6]
c =

   1   1  -6
   
   >> roots(c)
ans =

  -3
   2


   
    5.0000e-01   5.0000e-01  -1.0000e+00

>> 1 == 2
ans = 0
>> 1 == 1
ans =  1
>> det(inv(A)) ==
parse error:

  syntax error

>>> det(inv(A)) ==
                  ^

>> det(inv(A))
ans =  0.50000
>> p(x)=x^2+x-6
error: 'x' undefined near line 1 column 6
>> c=[1,1,-6]
c =

   1   1  -6

>> solve(c)
warning: the 'solve' function belongs to the symbolic package from Octave Forge
which seems to not be installed in your system.

Please read <http://www.octave.org/missing.html> to learn how you can
contribute missing functionality.
warning: called from
    __unimplemented__ at line 524 column 5
error: 'solve' undefined near line 1 column 1
>> roots(c)
ans =

  -3
   2

>>
>>
>>
>>
>> A = [4,-2,-10;2,10,-12;-4,-6,16]
A =

    4   -2  -10
    2   10  -12
   -4   -6   16

>> p(x1,x2,x3)=[4,-2,-10;2,10,-12;-4,-6,16]*(x1,x2,x3)
parse error:

  syntax error

>>> p(x1,x2,x3)=[4,-2,-10;2,10,-12;-4,-6,16]*(x1,x2,x3)
                                               ^

>> p(x1,x2,x3)=[4,-2
>>
>>
>>
>> p(x1,x2,x3)=[4,-2,-
>>
>>
>> p(x1,x2,x3)=[4,-2,-10;2,10,-12;-4,-6,16]*(x1,x2,x3)
>> A
A =

    4   -2  -10
    2   10  -12
   -4   -6   16

>> p(x1,x2,x3)=A*(x1,x2,x3)
parse error:

  syntax error

>>> p(x1,x2,x3)=A*(x1,x2,x3)
                     ^

>> p(x1,x2,x3)=A*[1,1,1]=[-10.32.-16]
parse error:

  invalid left hand side of assignment

>>> p(x1,x2,x3)=A*[1,1,1]=[-10.32.-16]
                        ^

>> c=A*[1,1,1]=[-10.32.-16]
parse error:

  invalid left hand side of assignment

>>> c=A*[1,1,1]=[-10.32.-16]
              ^

>> c=A*[1,1,1]
error: operator *: nonconformant arguments (op1 is 3x3, op2 is 1x3)
>> A
A =

    4   -2  -10
    2   10  -12
   -4   -6   16

>> c=A*[1,1,1]
>> A
A =

    4   -2  -10
    2   10  -12
   -4   -6   16

>> b=[1,1,1]
b =

   1   1   1

>> b=[-10,32,-16]
b =

  -10   32  -16

>> A /B
>> b=[-10;32;-16]
b =

  -10
   32
  -16

>> b=transpo[-10,32,-16]
>> b=[-10;32;-16]
>> b
b =

  -10
   32
  -16

>> A \b
ans =

   2
   4
   1

>> C = [1,1,-1;2,1,1;1,0,3]
C =

   1   1  -1
   2   1   1
   1   0   3

>> d= [0;1;-1]
d =

   0
   1
  -1

>> c \d
error: operator \: nonconformant arguments (op1 is 1x3, op2 is 3x1)
>> C \d
ans =

   5
  -7
  -2

>>