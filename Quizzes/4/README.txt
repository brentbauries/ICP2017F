1a)
function fac = getFacWhile(n)
fac = 1;
while(n>=2)
fac = fac*n;
n=n-1;
end
end

1b)
function fac = getFacFor(n)
fac = 1;
for i=n:-1:2
fac = fac*i;
end
end

1c)
function fac = getFacVec(n)
fac = prod(1:n);
end

2)
function out = timeFacFuncs
disp(['average runtime for getFacWhile(1700000): ', num2str(timeit(@() getFacWhile(1700000))), ' seconds']);
disp(['average runtime for getFacFor(1700000): ', num2str(timeit(@() getFacFor(1700000))), ' seconds']);
disp(['average runtime for getFacVec(1700000): ', num2str(timeit(@() getFacVec(1700000))), ' seconds']);
end




