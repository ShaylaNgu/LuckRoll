%Shayla Nguyen 29/04/2020
%Ability powers - rough test 

thrown = [1];
throw = -110;

%after 1 throw condition
if length(thrown) ~=0
    %Ability powers: addition (+)
    %if throw between [-120,-110] or [20,30]
    if (-120<= throw && throw <=-110) 
        %print measage telling user
        fprintf("You have GOT an Ability powers!\n");
        fprintf(" [Would you like to use it?]\n");
        userAP = input(":",'s');
        if strcmp(userAP,'y')
            throw = throw + 100;
            %print the roll(throw) the user got
            fprintf("The Ability power u got was [+]!\n");
            fprintf("~Adds 100 to the throw~\n");
            %adds animation function here
            fprintf("giving u: %d\n", throw);
        end  
    end     
    
    
    
 %reset userAP to No(n)
 userAP = "n";
end 