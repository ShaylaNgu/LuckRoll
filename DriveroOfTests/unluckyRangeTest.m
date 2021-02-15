%Shayla Nguyen 29/04/2020
%unlucky: a range where the user lands they get instant BAD luck!  
%every ten rounds user has an new unlucky range 

thrown = []; 
for i = 1:30 %for-loop to test functionity 
    

    %generating the unlucky range for every 10 rounds
    if mod(length(thrown),10) == 0
        unluckyMax = randi([-1000,1000]);
        unluckyMin = unluckyMax - 10;
    end 
    fprintf("%d",i);% to test functionity, makes easy to read
    fprintf("<strong>Your UNLUCKY range: [%d -> %d]</strong>\n", unluckyMin, unluckyMax);
    thrown = [thrown , i]; % to test functionity 
end 