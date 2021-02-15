%Shayla Nguyen 1/05/2020
%unlucky animation function 
function [] = unluckyAnimation()
%unluckyAnimation prints the unlucky'animation'
%   %display what throw will equal now, one digit at a time
%   throw = -999999999
%   then emphasis throw = -999999999,  by displaying it repeatly (3) in bold

    fprintf("Throw will now equal: -9\n");
    pause(1.5);
    fprintf("Throw will now equal: -99\n");
    pause(0.5);
    fprintf("Throw will now equal: -999\n");
    pause(0.5);
    fprintf("Throw will now equal: -9999\n");
    pause(0.5);
    fprintf("Throw will now equal: -99999\n");
    pause(0.5);
    fprintf("Throw will now equal: -999999\n");
    pause(0.5);
    fprintf("Throw will now equal: -9999999\n");
    pause(0.5);
    fprintf("Throw will now equal: -99999999\n");
    pause(0.5); 
    fprintf("Throw will now equal: -999999999\n");
    pause(0.5); 
    for i = 1:3
        fprintf("<strong>Throw will now equal: -999999999</strong>\n");
        pause(0.5); 
    end 
end

