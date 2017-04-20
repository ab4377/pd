function [sequentialData] = DivideIntoIntervals(data, intervalDuration)
    %% This function divides the activity data into chunks with duration equal to intervalDuration %%
       
    i = 0;
    frequency = 50;
    numberOfSeconds = intervalDuration;
    sequentialData = {};
    while(frequency*numberOfSeconds*i < size(data,1))
        if(frequency*numberOfSeconds*(i+1) > size(data,1))
            sequentialData{i+1} = data(frequency*numberOfSeconds*i + 1: end,:);
        else
            sequentialData{i+1} = data(frequency*numberOfSeconds*i + 1:frequency*numberOfSeconds*(i+1),:);
        end
        i = i + 1;
    end
end