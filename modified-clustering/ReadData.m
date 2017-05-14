function [fx1,fx2] = ReadData()
    % this script reads data from 'RawData.csv' and 'tags.csv'
    % and preprocesses them. 
    % 'RawData.csv' contains the accelerometer data measured 
    % at 50 Hz for 41 activities. 'tags.csv' contains the 
    % the observation number at which an activity starts to be 
    % measured and the observation number at which measurement 
    % for that activity ends. 

    disp('Reading raw data');
    data = csvread('RawData.csv',1, 3);
    disp('Reading tags');
    tags = csvread('tags.csv',0,1);
    tags = tags(:,1:2);
    disp('Setting tags');
    ntags = length(tags);
    taggedActivities = {};

    % Matching the tags with the raw data -- the tagged 
    % array will contain accelerometer data for 42 separate 
    % activities 
    for t=1:ntags
      taggedActivities{t} = data((tags(t,1)+1):tags(t,2),:);
    end
    
    size(taggedActivities{1}(1:end,1))
    matrix = SimilarityMeasure(taggedActivities);
    [~,fx1] = freqAnalysis(taggedActivities{1}(1:end,1));
    %disp(fx1);
    [~,fx2] = freqAnalysis(taggedActivities{10}(1:end,1));
    %disp('==============================================');
    %disp(fx2);
%     [ampx1,fx1] = freqAnalysis(taggedActivities{1}(1:end,1));
%     [ampy1,fy1] = freqAnalysis(taggedActivities{1}(1:end,2));
%     [ampz1,fz1] = freqAnalysis(taggedActivities{1}(1:end,3));
%     
%     [ampx2,fx2] = freqAnalysis(taggedActivities{10}(1:end,1));
%     [ampy2,fy2] = freqAnalysis(taggedActivities{10}(1:end,2));
%     [ampz2,fz2] = freqAnalysis(taggedActivities{10}(1:end,3));
%     
%     subplot(2,3,1);
%     for j=1:length(ampx1)
%         if(ampx1(j) > 0.05)
%             ampx1(j) = ampx1(j) - 0.05;
%         else
%             ampx1(j) = 0;
%         end
%        
%     end
%     plot(fx1,ampx1);
%     title('Activity 1 x-axis');
%     
%     subplot(2,3,2);
%     for j=1:length(ampy1)
%         if(ampy1(j) > 0.05)
%             ampy1(j) = ampy1(j) - 0.05;
%         else
%             ampy1(j) = 0;
%         end
%     end
%     plot(fy1,ampy1);
%     title('Activity 1 y-axis');
%     
%     subplot(2,3,3);
%     for j=1:length(ampz1)
%         if(ampz1(j) > 0.05)
%             ampz1(j) = ampz1(j) - 0.05;
%         else
%             ampz1(j) = 0;
%         end
%     end
%     plot(fz1,ampz1);
%     title('Activity 1 z-axis');
%     
%     subplot(2,3,4);
%     for j=1:length(ampx2)
%         if(ampx2(j) > 0.05)
%             ampx2(j) = ampx2(j) - 0.05;
%         else
%             ampx2(j) = 0;
%         end
%     end
%     plot(fx2,ampx2);
%     title('Activity 2 x-axis');
%     
%     subplot(2,3,5);
%     for j=1:length(ampy2)
%         if(ampy2(j) > 0.05)
%             ampy2(j) = ampy2(j) - 0.05;
%         else
%             ampy2(j) = 0;
%         end
%     end
%     plot(fy2,ampy2);
%     title('Activity 2 y-axis');
%     
%     subplot(2,3,6);
%     for j=1:length(ampz2)
%         if(ampz2 > 0.05)
%             ampz2(j) = ampz2(j) - 0.05;
%         else
%             ampz2(j) = 0;
%         end
%     end
%     plot(fz2,ampz2);
%     title('Activity 2 z-axis');
end