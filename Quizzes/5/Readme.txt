1)
in = importdata('chain.txt');
semilogx(x,y,'Color','red');
xlabel('Sample Number');
ylabel('Growth Rate');
saveas(gcf,'GrowthRate.png')


2)

function exists = robustWebRead(web)
disp('Reading data from the web address...');
try
exists = webread(web);
disp('Done.');
catch
disp('Warning: The requested page does not exist! Gracefully exiting...')
end
end

3)
gca is the keyword that will refer to the current axis.
gcf is the keyword that will refer to the current figure in MATLAB. 
