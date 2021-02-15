%Shayla Nguyen 1/05/2020
%This program with create a dice with values between with -1000 to 1000
%   then add all rolls(throws) together to find the absoloute values of the
%   sum (the score)
%Additional functionality
%   Unlucky range 
%   Ability powers
%   Luck plot
%       Saves plot 
%       Luck Score
%   Recording/sorting user's data to game database
%   HighScore art
%IMPORTANT: must have listed files at the bottom of program in the same
%           folder as the program for game the work properly 

%Initiate vectors for thrown values 
thrown = [];

%% Intro prompt 
%Welcome user to game and tells/ how controls works
fprintf("<strong>[Welcome to the luck game] </strong>\n");
disp("Note: 'y' means yes");
user =  input("Do you want you play? :", 's');

%check if user sure about choice and prompt user about controls
if ~strcmp(user,'y')
    disp("Are you sure you don't want to game play?");
    disp("Note: 'y' means yes");
    user =  input("Do you want you play? :", 's');
    assert(strcmp(user,'y'), "Ending Game");    
end 


%continues to roll the dice, as long as user wants (y)
while  strcmp(user,'y')
    %% The dice
    throw = randi([-1000,1000]);
    
    %% Generate new unlucky range every 10 rounds
    if mod(length(thrown),10) == 0
        unluckyMax = randi([-1000,1000]);
        unluckyMin = unluckyMax - 10;
        fprintf("<strong>Your UNLUCKY range: [%d -> %d]</strong>\n", unluckyMin, unluckyMax);
    end 
    
    %% Effect of unlucky range 
    %if throw plans in unlucky range 
    if (unluckyMin<= throw && throw <=unluckyMax)
        %print meassage to tell user throw is in unlucky range
        fprintf("<strong>You have landed in the UNLUCKY range [%d -> %d]</strong>\n",...
            unluckyMin, unluckyMax);
        pause(2);
        fprintf("That is unfortunate\n");
        pause(1);

        %display what throw will equal now, one digit at a time (animation)
        %refer to unluckyAnimation.m
        unluckyAnimation();

        %throw now equals -999999999
        throw = -999999999;
        assert(throw ~= -999999999, "END GAME");
    end 
    
    
    %% Tutorial stage for user
    %Only for 1st roll(throw) for user to understand the basics of 'game'
    if length(thrown)== 0
        %print the roll(throw) the user got
        fprintf("u got: %d\n", throw);
     
    
    %% Ability powers
    %activate: after 1 throw
    elseif length(thrown) ~=0
        %Ability powers: addition (+)
        %if throw between [-120,-110] or [20,30]
        if (-120<= throw && throw <=-110)|| (20<= throw && throw <=30)
            %print measage telling user
            fprintf("You have GOT an Ability powers!\n");
            %give user the choice to use it or not 
            fprintf(" [Would you like to use it?]\n");
            userAP = input(":",'s');
            %if user chooses to use ability 
            if strcmp(userAP,'y')
                %tell user what they originally got
                fprintf("u originally got: %d\n", throw);
                throw = throw + 100;
                %print the roll(throw) the user got
                fprintf("The Ability power u got was [+]!\n");
                fprintf("~Adds 100 to the throw~\n");
                %animation function here
                APAnimation2()
                fprintf("giving u: %d\n", throw);
            end
        %Ability powers: negative (-)
        %if throw between [-693,-683] or [900,910]  
        elseif (-693<= throw && throw <=-683)|| (900<= throw && throw <=910)
            %print measage telling user
            fprintf("You have GOT an Ability powers!\n");
            %give user the choice to use it or not 
            fprintf(" [Would you like to use it?]\n");
            userAP = input(":",'s');
            %if user chooses to use ability 
            if strcmp(userAP,'y')
                %tell user what they originally got
                fprintf("u originally got: %d\n", throw);
                throw = throw*-1;
                %print the roll(throw) the user got
                fprintf("The Ability power u got was [-]!\n");
                fprintf("~Switches positive to negative, negative to positive~\n");
                %animation function here
                APAnimation1()
                fprintf("giving u: %d\n", throw);
            end
        %if none of the Ability Powers conditons are met    
        else
            fprintf("u got: %d\n", throw);
        end
   
    end 

    %add new roll(throw) to all previous throws in vector called thrown
    thrown = [thrown,throw]; 
    
    %ask user to roll again, to continue loop
    user = input("Do u wanna continue? [yes = y, no = n]: ", 's');
end 

%% Luck plot
%ask user to view
userLuck = input("Do you want to view your luck plot? :", 's');
%if yes: 
if strcmp(userLuck, 'y')
    %create luck plot 
    figure
    x = 1:length(thrown);%Roll Number for x-coor
    plot(x,thrown,'bx:')
    line = lsline;%line of best fit/Least Square line
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
    legend('Roll','Your Luck','Location','SouthEastOutside');
    
    %% Saves plot 
    %ask if user wants to saves their luck plot
    userLP = input('Do u want to save your luck plot? :', 's');
    if strcmp(userLP,'y');
        disp('Must write ".png" after file name if save as image');
        saveas(gcf,input('Enter file name of your luck plot: ', 's'));
    end
    
    %% Luck score
    %calculating luck score from (least Squares Fit line) values 
    [polyvalues] = polyfit(x,thrown, 1); %(linear)
    luckScore = (polyvalues(1)*abs(polyvalues(2))+polyvalues(2))/100;
    fprintf("Your luck score was: %0.2f\n", luckScore);  
   
    
end 

%% calculate the sum of thrown (score)
%   via running sum in for-loop
%initiate sum to zero
sum = 0;
for i = 1:length(thrown)
    sum = sum + thrown(i);
end 
%calculate absoloute values of the sum - score
score = abs(sum);

%display score
fprintf("Your score is: %d\n", score);

%% Recording/adding user's score to database
%ask if want to save score
ask = input("Do u wanna save score? [yes! = y, no._. = n]: ", 's');

%load in game's database to get previousNames and scoreHistory varibles 
load('gameDatebase.mat');

%initialise index called i for while loop below
i = 1;
%saves score user's name if user asks y 
if strcmp(ask, 'y')
    userName = input("Enter your name! : ", 's');
    %while loop checks if name is already used
    while i < length(previousNames)+1
        %checks if name is already used
        while strcmp(previousNames(i),userName);
            fprintf("Input errors name is taken\n");
            userName = input("Enter a different name: ", 's');
            i = 1; %resets i(index) back to one if name is already used
            % this makes is so that new name will checked from the start
        end
        i = i + 1; %move to next index 
    end
    %% Recording/sorting user's data to game database
    %add approved UserName to list of usernames 
    previousNames = [previousNames, userName];
    %add to user's score scoreHistory of game
    Score = string(score); %must make score a string before adding 
    scoreHistory = [scoreHistory; [userName , Score]];
    
    %saving new  previousNames and scoreHistory to files
    save('gameDatebase.mat', 'previousNames', 'scoreHistory');
    
    %% Personalised score meassage 
        
    %Different score meassage  depending on score achieved
    if score > 1000 && score <=1999
        fprintf("%s's score is %d!\n", userName, score);
    elseif score >= 2000
        fprintf("%s's score is %d! THATS AMAZING!!!\n", userName, score);
    else
        fprintf("%s's score is %d\n", userName, score);
    end 
    
    %High score are
    %display image if user's score above 4000
    %IMPORTANT:
    %   image from: https://icdn5.digitaltrends.com/image/digitaltrends/not-bad-obama-416x416.png 
    if score > 4000
        imshow('highScoreArt.png');
    end    
end

%% Must have in same folder
%   APAnimation1.m
%   APAnimation2.m
%   unluckyAnimation.m
%   gameDatebase.mat
%   highScoreArt.png