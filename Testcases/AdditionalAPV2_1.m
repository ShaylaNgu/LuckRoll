%Shayla Nguyen 29/04/2020
%Additional Ability powers - tests 
%Ability powers:
%   (+) [-120,-110]  [20,30]
% New added AP
%   (-) [-693,-683] [900,910]  
%   (|| ||) [80,90]

%throw = -110;
%throw = 910;
%for test pursoses:
%throw = input("throw:");

if (-120<= throw && throw <=-110)|| (20<= throw && throw <=30)
    %print measage telling user
    fprintf("You have GOT an Ability powers!\n");
    fprintf(" [Would you like to use it?]\n");
    userAP = input(":",'s');
    if strcmp(userAP,'y')
        throw = throw + 100;
        %print the roll(throw) the user got
        fprintf("The Ability power u got was [+]!\n");
        fprintf("~Adds 100 to the throw~\n");
        %animation function here
        APAnimation2()
        fprintf("giving u: %d\n", throw);
    end
elseif (-693<= throw && throw <=-683)|| (900<= throw && throw <=910)
    %print measage telling user
    fprintf("You have GOT an Ability powers!\n");
    fprintf(" [Would you like to use it?]\n");
    userAP = input(":",'s');
    if strcmp(userAP,'y')
        throw = throw*-1;
        %print the roll(throw) the user got
        fprintf("The Ability power u got was [-]!\n");
        fprintf("~Switches positive to negative, negative to positive~\n");
        %animation function here
        APAnimation1()
        fprintf("giving u: %d\n", throw);
    end
end