%Shayla Nguyen 28/04/2020
%Ability powers - rough test 

thrown = [1];
throw = -110;

%after 1 throw condition
if length(thrown) ~=0
    %if throw between [-110,-120] 
    if -110<= throw || throw <=-120 %Ability powers: addition (+)
        %print measage telling user
        fprintf("You have GOT an Ability powers!\n");
        fprintf(" [Would you like to use it?]\n");
        userAP = input(":",'s');
        if strcmp(userAP,'y')
            throw = throw + 100;
            %print the roll(throw) the user got
            fprintf("The Ability power u got was [+]!");
            fprintf("giving u: %d\n", throw);
        end  
    end     
    
    
    
 %reset userAP to No(n)
 userAP = "n";
end 