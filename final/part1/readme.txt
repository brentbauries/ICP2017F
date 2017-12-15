load('cells.mat')
Time=[10,12,14,16,18,20,22] ;
timeValue = 0;
for i = 1:7
    timeValue = timeValue + 1;
row = round(sqrt(length(cells(1,1,:,:))));
col = row;
fig = figure(); % makes a figure
fig.Position = [0, 0, 900, 1350]; % set bottom right corner to (0,0) and set size
fig.Visible = 'on'; % make the figure visible
fig.Color = [0.9400    0.9400    0.9400]; % set the background color of the figure to MATLAB default. You could try other options, such as 'none' or color names 'red',...
% main plot specifications
mainPlotMarginTop = 0.06; % sets the top margin of the main plot
mainPlotMarginBottom = 0.12; % sets the bottom margin of the main plot
mainPlotMarginLeft = 0.08; % sets the left margin of the main plot
mainPlotMarginRight = 0.1; % sets the right margin of the main plot
mainPlotPositionX = 0.05; % the position in x of the main figure
mainPlotPositionY = 0.08; % the position in y of the main figure
mainPlotWidth = 1 - mainPlotMarginRight - mainPlotPositionX; % sets the width to fit between the left and right margins
mainPlotHeight = 1 - mainPlotMarginTop - mainPlotPositionY; % sets the height to fit between top and bottom margins
mainPlotTitleFontSize = 12;
mainPlotAxisFontSize = 12;
mainPlot = axes(); % create a set of axes in this figure. This main axes is needed in order to add the x and y labels and the color bar for the entire figure.
mainPlot.Color = 'none'; % set color to none
mainPlot.Position = [ mainPlotPositionX mainPlotPositionY mainPlotWidth mainPlotHeight ]; % set position of the axes
mainPlot.XLim = [0 1]; % set X axis limits
mainPlot.YLim = [0 1]; % set Y axis limits
mainPlot.XLabel.String = 'Voxel Number in X Direction'; % set X axis label
mainPlot.YLabel.String = 'Voxel Number in Y Direction'; % set Y axis label
mainPlot.XTick = []; % remove the x-axis tick marks
mainPlot.YTick = []; % remove the y-axis tick marks
mainPlot.XAxis.Visible = 'off'; % hide the x-axis line, because we only want to keep the x-axis label
mainPlot.YAxis.Visible = 'off'; % hide the y-axis line, because we only want to keep the y-axis label
mainPlot.XLabel.Visible = 'on'; % make the x-axis label visible, while the x-axis line itself, has been turned off;
mainPlot.YLabel.Visible = 'on'; % make the y-axis label visible, while the y-axis line itself, has been turned off;
mainPlot.Title.String = ['Time = ',num2str(Time(i)), ' days. Brain MRI slices along the Z-direction, Rat W09. No radiation treatment.'];%,' x ',sprintf('%0.1f',ncol),' subplots using MATLAB']; % set the title of the figure
mainPlot.FontSize = 11; % set the main plot font sizemainPlot.XLabel.FontSize = mainPlotAxisFontSize; % set the font size for the x-axis in mainPlot
mainPlot.YLabel.FontSize = mainPlotAxisFontSize; % set the font size for the y-axis in mainPlot
mainPlot.Title.FontSize = mainPlotTitleFontSize; % set the font size for the title in mainPlot
% specifications of the color bar to the figure
colorbarPositionX = 1 - mainPlotMarginRight; % the x-position of the color bar
colorbarPositionY = mainPlotMarginBottom; % the y-position of the color bar
colorbarWidth = 0.03; % the width of the color bar
colorbarHeight = 1 - 2*colorbarPositionY; % the height of the color bar
colorbarFontSize = 13; % the font size of the color bar
colorLimits = [0,max(max(max(cells(:,:,:))))]; % the color bar limits, the dataset contains numbers between 0 and some large number.
% now add the color bar to the figure
axes(mainPlot); % focus on the mainPlot axes, because this is where we want to add the colorbar
caxis(colorLimits); % set the colorbar limits
cbar = colorbar; % create the color bar!
ylabel(cbar,'Number of Tumor Cells'); % now add the color bar label to it
cbar.Position = [ colorbarPositionX ... Now reset the position for the colorbar, to bring it to the rightmost part of the plot
                  colorbarPositionY ...
                  colorbarWidth ...
                  colorbarHeight ...
                ];
cbar.FontSize = colorbarFontSize; % set the fontsize of the colorbar
 
subplotInterspace = 0.03;
subplotWidth = (1- mainPlotMarginLeft - mainPlotMarginRight)/(col) - subplotInterspace;
subplotHeight = (1- mainPlotMarginTop - mainPlotMarginBottom)/(row) - subplotInterspace;
colorLim = [0,max(max(max(cells(:,:,:))))];
slice = 1;
for nrow = row:-1:1
   
     for ncol = 1:col
     
        subPlot =axes   ('position', [ ...
                        mainPlotMarginLeft + (ncol-1)*(subplotInterspace+subplotWidth)...
                        ,mainPlotMarginBottom + (nrow-1)*(subplotHeight+subplotInterspace)...
                        ,subplotWidth...
                        ,subplotHeight...
                        ]...
                        );
                  
                    imagesc(cells(:,:,slice,timeValue)) %,timeSlice)
                    subPlot.CLim = colorLim;
                    subPlot.Title.String = ['z = ', num2str(slice)];
                    if ncol~=1
                        subPlot.YTickLabel = [];
                    end
                    if nrow~=1
                        subPlot.XTickLabel = [];
                    end
                      slice = slice + 1;
     end           
end
end 
