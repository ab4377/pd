function [fx1,fx2] = ComputeConsecutiveDistance()
    %TENSECONDINTERVALDISTANCEGROUPEDBYACTIVITY Summary of this function goes here
    disp('Reading raw data');
    data = csvread('RawData.csv',1, 3);
    disp('Reading tags');
    tags = csvread('tags.csv',0,1);
    tags = tags(:,1:2);
    disp('Setting tags');
    %ntags = length(tags);
    
    [fx1,fx2] = TenSecondIntervalDistance(data,0.05);
    %plot(distance);
end

