1a)
function convert = convertTempFor(InVec,statement)
convert = zeros(1,length(InVec));
if(strcmp(statement,'C2F')==1)
    for i=1:length(InVec)
        convert(1,i) = 1.8*InVec(1,i)+32;
    end
 
elseif(strcmp(statement,'F2C')==1)
    for i=1:length(InVec)
        convert(1,i) = 5*(InVec(1,i)-32)/9;
    end
else
    error('Input must be C2F or F2C');
end
end

1b)
function convert = convertTempWhile(InVec,statement)
convert = zeros(1,length(InVec));
if(strcmp(statement,'C2F')==1)
    i=1;
    while(i~=length(InVec)+1)
        convert(1,i) = 1.8*InVec(1,i)+32;
        i=i+1;
    end

elseif(strcmp(statement,'F2C')==1)
     i=1;
    while(i~=length(InVec)+1)
        convert(1,i) = 5*(InVec(1,i)-32)/9;
        i=i+1;
    end
else
    error('Input must be C2F or F2C');
end
end

1c)
function convert = convertTempVec(InVec,statement)
convert = zeros(1,length(InVec));
if(strcmp(statement,'C2F')==1)
    i = 1:length(InVec);
    convert(1,i) = 1.8*InVec(1,i)+32;
elseif(strcmp(statement,'F2C')==1)
  	i = 1:length(InVec);
    convert(1,i) = 5*(InVec(1,i)-32)/9;
else
    error('Input must be C2F or F2C');
end
end

2. starterdata = [-20, -15, -10, -5, 0, 5, 10, 15, 20, 25, 30, 35, 40];
>> tic, convertTempFor(starterdata,'C2F') ,toc

ans =

    -4     5    14    23    32    41    50    59    68    77    86    95   104

Elapsed time is 0.000896 seconds.
>> tic, convertTempWhile(starterdata,'C2F') ,toc

ans =

    -4     5    14    23    32    41    50    59    68    77    86    95   104

Elapsed time is 0.000671 seconds.
>> tic, convertTempVec(starterdata,'C2F') ,toc

ans =

    -4     5    14    23    32    41    50    59    68    77    86    95   104

Elapsed time is 0.000290 seconds.

3. function statement = extractLetter(cellofchars)
if(isa(cellofchars,'cell'))
    arr = [];
    length = size(cellofchars);
    for i=1:length(2)
        arr = [arr cellofchars{i}];
    end
 statement = strjoin(arr,''); 
else
    error('Input must be a cell array');
end
end

4. The code takes the square root of 2.0 and then squares the result
Then it starts with 2.0 and takes the square root two times and then squares the result two times.
it keeps doing this process until it has done it n times
the more times that the code is run the more off the final number will be because of round off error

sqrt rounds to 16 places after the decimal. Then squaring that number rounds again. if this repeats many times then the number
will be far from the origional.

5. 1.0~=1.0+eps eps must be 0. Each time through the loop- eps is divided by 2. when eps is so small that the 16 digits after the
decimal are all 0 eps=0 making the statement false.

6. 
function largest = getLargestprime(number)
for i = number: -1 :1
    if isprime(i)
        largest = i;
        break;
    end
end

7a) function fib()

    n = input('Please enter a non-negative integer or type stop: ','s');
    if strcmp(n,'stop')
        return
    else
        n = str2double(n);
        if isreal(n)
            if n>=0 && round(n)==n
                disp(['fib(',num2str(n),') = ',num2str(getFib(n))]);
                
                f = @() getFib(n);
                disp([ char(9) 'average runtime: ' num2str(timeit(f))]);
                
                fib()
                return
            end
        end
        disp('The input argument is not a non-negative integer!');
        fib()
    end
    
    function fib = getFib(n_int)
        if n_int == 0
            fib = 0;
        elseif n_int == 1
            fib = 1;
        else
            fib = getFib(n_int-1) + getFib(n_int-2);
        end
    end

end

7b) 
function fibloop()

    n = input('Please enter a non-negative integer or type stop: ','s');
    if strcmp(n,'stop')
        return
    else
        n = str2double(n);
        if isreal(n)
            if n>=0 && round(n)==n
                disp(['fib(',num2str(n),') = ',num2str(getFib(n))]);
                
                 f = @() getFib(n);
                disp([ char(9) 'average runtime: ' num2str(timeit(f))]);
                
                fibloop()
                return
            end
        end
        disp('The input argument is not a non-negative integer!');
        fib()
    end
    
    function fib = getFib(n_int)
        firstnum = 0;
        secondnum = 1;
        for i = 2:n_int
            fib = firstnum+secondnum;
            firstnum=secondnum;
            secondnum=fib;
        end
    end

end

7c)
>> fib
Please enter a non-negative integer or type stop: 10
fib(10) = 55
	average runtime: 0.00018058
Please enter a non-negative integer or type stop: 15
fib(15) = 610
	average runtime: 0.0010066
Please enter a non-negative integer or type stop: 20
fib(20) = 6765
	average runtime: 0.00078943
Please enter a non-negative integer or type stop: 25
fib(25) = 75025
	average runtime: 0.0086835
Please enter a non-negative integer or type stop: 30
fib(30) = 832040
	average runtime: 0.098003
Please enter a non-negative integer or type stop: 35
fib(35) = 9227465
	average runtime: 1.1271
Please enter a non-negative integer or type stop: stop

>> fibloop
Please enter a non-negative integer or type stop: 10
fib(10) = 55
	average runtime: 4.9501e-06
Please enter a non-negative integer or type stop: 15
fib(15) = 610
	average runtime: 3.7292e-06
Please enter a non-negative integer or type stop: 20
fib(20) = 6765
	average runtime: 3.8724e-06
Please enter a non-negative integer or type stop: 25
fib(25) = 75025
	average runtime: 3.8818e-06
Please enter a non-negative integer or type stop: 30
fib(30) = 832040
	average runtime: 3.8597e-06
Please enter a non-negative integer or type stop: 35
fib(35) = 9227465
	average runtime: 3.9081e-06
Please enter a non-negative integer or type stop: stop

fibLoop doesn't use recursion making it faster
fib checks each case individually slowing it down where fibloop checks as many as it can at once.

8a)
function output = timeFib(n)
if(~ischar(n)&&isreal(n)&&n>=0&&round(n)==n)
output = struct;
f = @() getFib(n);
output(1).n = n;
output(1).fib = getFib(n);
output(1).runtime = timeit(f);
else
    error('The input argument is not a non-negative integer!');
end


    function fib = getFib(n_int)
        if n_int == 0
            fib = 0;
        elseif n_int == 1
            fib = 1;
        else
            fib = getFib(n_int-1) + getFib(n_int-2);
        end
    end
end

function output = timeFibLoop(n)
if(~ischar(n)&&isreal(n)&&n>=0&&round(n)==n)
output = struct;
f = @() getFib(n);
output(1).n = n;
output(1).fib = getFib(n);
output(1).runtime = timeit(f);
else
    error('The input argument is not a non-negative integer!');
end

    function fib = getFib(n_int)
        firstnum = 0;
        secondnum = 1;
        for i = 2:n_int
            fib = firstnum+secondnum;
            firstnum=secondnum;
            secondnum=fib;
        end
    end
end

8b)
function fibrecur = writeFibResult()

    n = 1;                            
     numbers = {};
    while(~strcmp(n,'stop'))
        n = input('Please enter a non-negative integer or type stop: ','s');
        if strcmp(n,'stop')
          break;
        else
          n = str2double(n);
          length = size(numbers);  
          numbers{1,length(2)+1}=n;
        end
    end 

b = size(numbers);
disp(numbers);
%disp(class());
for i = 1:b(2)
    fibrecur(i) = timeFib(cell2mat(numbers(i))); 
    fibloop(i) = timeFibLoop(cell2mat(numbers(i)));
end

myarray1 = [fibrecur.n;fibrecur.fib;fibrecur.runtime];
fileID = fopen('fibOutput.txt','w');
fprintf(fileID,'%6s %11s %17s\n','n','fib','runtime(s)');
fprintf(fileID,'%6d %11d %16.5d \n',myarray1); 
fclose(fileID);

myarray2 = [fibloop.n;fibloop.fib;fibloop.runtime];
fileID = fopen('fibLoopOutput.txt','w');
fprintf(fileID,'%6s %11s %17s\n','n','fib','runtime(s)');
fprintf(fileID,'%6d %11d %16.5d \n',myarray2);
fclose(fileID);

end
