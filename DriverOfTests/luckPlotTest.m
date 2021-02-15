%Shayla Nguyen 1/05/2020
%Luck plot - test

thrown = [-443    94   915   930  -685   942   915   -29   601  -717  -157   832   585];
%thrown = [1:15]; % line: y = x to 15
% thrown = [1:-1:-15]; % line: y = -x to -15
% thrown = zeros([1,15]); %horizonatal line at y = 0

%luck plot
    figure
    x = 1:length(thrown);%Roll Number for x-coor
    plot(x,thrown,'bx:')
    line = lsline;%line of best fit
    line.Color = 'r';
    %sets the Axis of plot 
    ax = gca;
    ax.XAxisLocation = 'origin'; %want x-axis to be center of plot
    ax.YAxisLocation = 'left'; %want y-axis to be on left of plot
    %labels of title and x-aixs and y-axis
    title('Luck Plot')
    xlabel('Roll Number')
    ylabel('Dice Number')
    %Labels what the dot and line mean for user 
    %legend('Roll','Your Luck','Location','best');
    legend('Roll','Your Luck','Location','SouthEastOutside');
    
    %% Luck score
    %calculating luck score from (least Squares Fit line) values 
    [polyvalues] = polyfit(x,thrown, 1); %(linear)
    luckScore = polyvalues(1)*polyvalues(2);
    
    
    %% Saves plot 
    userLP = input('Do u want to save your luck plot? :', 's');
    if strcmp(userLP,'y');
        disp('Must write ".png" after file name if save as image');
        saveas(gcf,input('Enter file name of your luck plot: ', 's'));
    end
        