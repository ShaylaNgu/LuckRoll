%Shayla Nguyen 1/05/2020
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

