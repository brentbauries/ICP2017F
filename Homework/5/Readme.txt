1.) 
function groups = RandGroup()
rng(131313);
triples = randperm(99);
fileID = fopen('students.csv');
table = readtable('students.csv');
groups = cell(33,3);
row = 1;
col = 1;
for i = 1:99
  groups{row,col} =  cell2mat(table{triples(i),2});
  if(row == 33)
    row = 1;
    col = col + 1;
  else
    row = row + 1;
  end
end
fclose(fileID);
xlswrite('groups.xlsx',groups);
end


2.
function fetchDataFromWeb()
datatable = webread('http://www.shahmoradi.org/ICP2017F/homework/5-problems/triggers.txt');
datatable = strsplit(datatable,'\n');
dataDir = '.swift/';
mkdir(dataDir);
count = 0;
for i=1:length(datatable)
    
    try
       repo = 'http://www.shahmoradi.org/ICP2017F/homework/5-problems/swift/';
       filename = ['GRB', datatable{i}, '_ep_flu.txt'];
       dataURL = [repo,filename];
       fileID = fopen([dataDir,filename],'w');
       fprintf(fileID, '%s',webread(dataURL));
       fclose(fileID);
    catch
       count = count + 1;
       disp(['The requested file does not exist on the web! skipping...', num2str(count)]);
    end
    
end
disp(['There are ' , num2str(count), ' missing files'])
end



function plotDataFromFile()
directory = dir('\Users\Brent\Documents\MATLAB\.swift');
total = 0;
data = [0,0];
     for i = 3:size(directory)
         if(directory(i).bytes>0)
             currentdata = readtable(['.swift/',directory(i).name]);
             try 
                 currarr = table2array(currentdata);
                 if(all(currarr(:,2)<0.0)) 
                     data = [data ; table2array(currentdata)];
                     total = total+1;
                 end
             catch
                 disp(['didnt recognize', directory(i).name]);
             end
         end
     end
    
    scatter(exp(data(:,2)), data(:,1), 1,'red','filled','MarkerFaceAlpha',.1,'MarkerEdgeAlpha',.1);
   
    title('Plot of E_p_e_a_k vs Fluence for 650 Swift GRB events');
    xlabel('Fluence [ergs/cm^2]');
    set(gca,'xscale','log');
    xlim([1.0000e-08 1.0000e-02]);
    xticks([ 1.0000e-8 1.0000e-6 1.0000e-4 1.0000e-2]);
    
   
    ylabel('E_p_e_a_k');
    set(gca,'yscale','log');
    ylim([1.0000e0 1.0000e04]);

    disp(num2str(total));
end 


3. 
function montehall()
rng('shuffle');
winCounter = 0; 
nsample = 10000;
data = [0,0];
    for isample = 1:nsample
        doors = [1,2,3];
        doorWithCar = randi(3);
        myChoice = randi(3);
        hostChoice = doors(doors~=doorWithCar);
        hostChoice = hostChoice(hostChoice~=myChoice);
        hostChoice = hostChoice(randi(length(hostChoice)));   
        mynewChoice = 6-hostChoice-myChoice;   
        if(mynewChoice == doorWithCar)
           winCounter = winCounter + 1;
           data = [data ; [isample winCounter/isample]];
        end
    end
    scatter((data(:,1)), data(:,2),1);
    disp (['The winning percentage due to switching is', num2str(winCounter/nsample)]);
    
 4.
function montypi()
n = 5000000;
points = rand(n,2);
circle = zeros(n,2);
place = 1;
for i = 1:n
        dist = sqrt(points(i,1)^2+points(i,2)^2);
       if(dist<=1)
           circle(place,1) = points(i,1);
           circle(place,2) = points(i,2);
           place = place + 1;
       end
end

circle = circle(1:place,1:2);
disp(['pi is ' num2str(4*length(circle)/(n)) ' for ' num2str(n) ' points']);

c = [244,223,65];
c = c/255;
scatter(circle(:,1),circle(:,2), 3, c, 'filled');
title(['pi is ' num2str(4*length(circle)/(n)) ' for ' num2str(n) ' points']);

end
