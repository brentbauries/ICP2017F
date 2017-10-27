1.
function [y]=gauss(u,o,x)
y=(1/((sqrt(2*pi))*o))*exp(((-1/2)*(((x-u)/o)^2)));
end

2.
function [t]=egg(To,Tw,Ty)
t=(((67^(2/3))*(3.7)*(1.038^(1/3)))/((.0054*(pi^2))*(((4*pi)/3)^(2/3))))*log(.76*((To-Tw)/(Ty-Tw)));
end

3.
function outputCartesianStruct=getCartesian(inputPolarStruct)
r=inputPolarStruct.r;
phi=inputPolarStruct.phi;
if(r<0)
    disp('r should not be negative!');
else
    x=r*cos(phi);
    y=r*sin(phi);
outputCartesianStruct=struct('x',x,'y',y);
end
end 

4.
s=dir('/Users/Brent/desktop/mynewdir')
s_size = size(s);
nfile = s_size(1);
size_total = 0;
for i=1:nfile
    size_total = size_total + s(i).bytes;
end
size_total
    
5.
function f=fibo(n)
s=n;
while(1)
    n=s;
while (n<0 || (n - round(n)~=0))
    disp('n must be positive');
    n = input('input a new n: ');
end
f_old_1 = 0;
f_old_2 = 1;
f=0;
if(n==0) f = 0;
elseif(n==1) f = 1;
else
    while(n>=1)
        f = f_old_1 + f_old_2;
        f_old_2 = f_old_1;
        f_old_1 = f;
        n = n-1;
    end
end
disp(f)
s = input('Enter a new non-negative number or type stop ')
if(s=='stop') break;
end
end
end

6.
function OutputArea = getTriangleArea(vertices)
x1=vertices.x1;
y1=vertices.y1;
x2=vertices.x2;
y2=vertices.y2;
x3=vertices.x3;
y3=vertices.y3;
area=(((1/2)*abs((x2*y3)-(x3*y2)-(x1*y3)+(x3*y1)+(x1*y2)-(x2*y1))));
OutputArea=struct('area',area);
end

vertices=struct('x1',2,'y1',4,'x2',1,'y2',1,'x3',-5,'y3',3);
getTriangleArea(vertices)

7.
function yesorno = isPrime(n)
if n <= 1
yesorno = false;
elseif n <= 3
yesorno = true;
elseif mod(n, 2) == 0
yesorno = false;
else
yesorno = primedivision(n, 3);
end

function yesorno2 = primedivision(n, divisor)
if (mod(n, divisor) == 0)
yesorno2 = false;
elseif divisor >= int32(sqrt(n)) + 1
yesorno2 = true;
else
yesorno2 = primedivision(n, divisor + 2);
end

8.
function g = getFunc(varargin)
switch nargin
case 1
a = varargin{1};
b = 0;
c = 0;
case 2
a = varargin{1};
b = varargin{2};
c = 0;
case 3
a = varargin{1};
b = varargin{2};
c = varargin{3};
otherwise 
error('too many arguments')
end
g = @(x) a*x.^2 + b*x + c;
end
