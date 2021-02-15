%Shayla Nguyen 1/05/2020
%unluckyRangeV2.1: test
%effect of unlucky range:
%   instantly ends game and makes throw = -999,999,999 
thrown = [1:10]; 
throw = 0;



%% generating the unlucky range for every 10 rounds
if mod(length(thrown),10) == 0
    unluckyMax = randi([-1000,1000]);
    unluckyMin = unluckyMax - 10;
end 
fprintf("<strong>Your UNLUCKY range: [%d -> %d]</strong>\n", unluckyMin, unluckyMax);


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
end 

