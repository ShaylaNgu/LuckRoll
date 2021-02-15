%Shayla Nguyen 01/05/2020
%This program Records/adds user's score to database

%for test purposes:
% set: score 
score = 1000;

%ask if want to save score
ask = input("Do u wanna save score? [yes! = y, no._. = n]: ", 's');

%%%%%%%%%%%%%%%%%%
%testing
% real will load previousNames files and scores
% previousNames = load(previousNames.....)
% previousNames = ["1", "2", "3", "4", "1.0", "ki-2", "$", "hi", "o o", "treeeeeeeeeeeeeeeeeee"];
% scoreHistory = ["Username", "Score";"1","100"; "2", "1000"; "3", "-1112"; "4", "-8";...
%     "1.0", "500"; "ki-2", "893"; "$", "-309"; "hi", "44"; "o o", "-77"; "treeeeeeeeeeeeeeeeeee",...
%     "1333"];


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
    %%
    %add approved UserName to list of usernames 
    previousNames = [previousNames, userName];
    %add to user's score scoreHistory of game
    Score = string(score); %must make score a string before adding 
    scoreHistory = [scoreHistory; [userName , Score]];
    
    %saving new  previousNames and scoreHistory to files
    save('gameDatebase.mat', 'previousNames', 'scoreHistory');
    
    %%
    
    
    %%only for now
    if score > 550 && score <=999
        fprintf("%s's score is %d!\n", userName, score);
    elseif score >= 1000
        fprintf("%s's score is %d! THATS AMAZING!!!\n", userName, score);
    else
        fprintf("%s's score is %d\n", userName, score);
    end 
    
end

%%

%%
%%%%%%%%%%%%%%%%%%%%%%%%
%find way to link user name with score
    
%ask = input("ARE U SURE?! Score will be lost forever... ;-;  [yes! = y, no._. = n]: ", 's');
%end


%extra function to be added next patch
%   remembering user names and making sure 
%
% for u = 1:length(previousNames)
%     if strcmp(previousNames(i),userName)
%         fprintf("invalid name")
%       %somthing to promot user not to do it 
%     end 
% end 
%adding aproved name to list of usersnames 
%previousNames = [previousNames; userName];
%table of all previous scores called: scoreHistory
%adding aproved name to list of usersnames 
%scoreHistory = [scoreHistroy; userName, score]
%