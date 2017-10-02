1)
a=1 — makes an a variable with value 1
b=‘x’ — makes a b character variable with a value of ‘x’
c=true — makes c a logical variable with value of true(1)
whos a b c — tells details about a, b, and c variables
Name Size Bytes Class Attributes
 a 1x1 8 double
 b 1x1 2 char
 c 1x1 1 logical
a==c — assigns the a variable the value of c (a true logical variable)
a + c — outputs 2 because a true logical variable has a value of 1
d = [1 2 3 4] — creates a 1x4 matrix with values 1 2 3 and 4
e=[‘a’ ‘b’ ‘c’ ‘d’] — creates a 1x4 array of char variables, ‘abcd’
f=[‘abcd’] — same output as e
g={‘a’, ‘b’, ‘c’, ‘d’} — error- can not put char variables in a cell
h={a b c d} — creates a 1x4 cell containing a, b, c, and d
whos d e f g h — tells details about variables d, e, f, and h variables
 Name Size Bytes Class Attributes
 d 1x4 32 double
 e 1x4 8 char
 f 1x4 8 char
 h 1x4 491 cell
2)
>> intmin int16
ans =
 int16
 -32768
>> intmax int16
ans =
 int16
 32767
>> intmin int32
ans =
 int32
 -2147483648
>> intmax int32
ans =
 int32
 2147483647
3)
basically 2/1
ans =
 2
1/2
ans =
 0.5000
1/2 as int8 type
ans =
 int8
 1
1/3 as int8 type
ans =
 int8
 0
-1(5^2)
ans =
 -25
(-5)^2
ans =
 25
10-(6/2)
ans =
 7
5*(4/2)*3
ans =
 30
4a)
>> a=[1,0;2,1]
a =
 1 0
 2 1
>> b=[-1,2;0,1]
b =
 -1 2
 0 1
>> c=[3;2]
c =
 3
 2
>> d=[5]
d =
 5
4b)
adding values that are in same locations in matrices
>> a+b
ans =
 0 2
 2 2
dot product of a and b matrices
>> a .* b
ans =
 -1 0
 0 1
cross product of a and b matrices
>> a*b
ans =
 -1 2
 -1 2
 -2 5
cross product of a and c matrices
>> a*c
ans =
 3
 8
adding a and c matrices
>> a+c
ans =
 4 3
 4 3
adding a and d matrices
>> a+d
ans =
 6 5
 7 6
dot product of a and d matrices
>> a .* d
ans =
 5 0
 10 5
cross product of a and d matrices
>> a * d
ans =
 5 0
 10 5
5)
5a)
 >> x=[2,2,2]
x =
 2 2 2
>> diag(x)
>> diag(x)
ans =
 2 0 0
 0 2 0
 0 0 2
5b)
>> 2*(eye(3))
ans =
 2 0 0
 0 2 0
 0 0 2
5c)
A =
 0 0 0
 0 0 0
 0 0 0
>> v=[1 5 9]
v =
 1 5 9
>> A(v)=2
A =
 2 0 0
 0 2 0
 0 0 2
6)
Code submitted separately.
7)
8)
File/Users/Brent/Desktop/mynewdir/myscript.m is not found in the current folder or on the MATLAB
path.
To run this file, you can either change the MATLAB current folder or add its folder to the MATLAB
path.
