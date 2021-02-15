previousNames = ["1.0", "ki-2", "$", "hi", "o o", "treeeeeeeeeeeeeeeeeee"];
userName = [];


%ask if want to save score
ask = input("Do u wanna save score? [yes! = y, no._. = n]: ", 's');

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
end

