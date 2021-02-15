%Shayla Nguyen 1/05/2020
%unlucky: test

%% effect of unlucky range:
%   print message to inform user
%   instantly ends game and makes throw = -999,999,999 
%   will slowly print 'throw with equal to -999999999' like animated  

%% Effect of unlucky range 

%setting unluckyMax and throw for testing pur
unluckyMax = -500;
unluckyMin = unluckyMax - 10;

throw = -500;
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