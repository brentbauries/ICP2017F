(4)
```bash
function totalLogProb = project3_4(x)
 global numTcells
    nsample = length(numTcells);
    logprob = zeros(nsample,1);
    for isample = 1:nsample
        logprob(isample) = log((1/(x(3)*sqrt(2*pi)))*exp(-(((log(numTcells(isample))-log(Gompertzian(x(1), x(2), isample)))^2)/(2*x(3)*x(3)))));
    end
    totalLogProb = - sum (logprob);
end

function N = Gompertzian(lamda, c, isample)
        t  = (2*isample)+8;
        N = 100000*exp(lamda*(1-exp((-1)*c*t)));
    end

```

(5)
```bash
load('Cells.mat');
global numTcells 
numTcells = sum(sum(sum(cells)));
numTcells = shiftdim(numTcells,3);
x0 = [10, 0.1, 1];
x = fminsearch(@project3_4, x0);
disp(['lamda: ', num2str(x(1)), ' , c: ',  num2str(x(2)), ' , sigma: ',  num2str(x(3))])

hold on;
time = linspace(0,25,25);
N = 100000*exp(x(1)*(1-exp((-1)*x(2)*time)));
plot(time, N, 'LineWidth', 3)
hold on;

```
