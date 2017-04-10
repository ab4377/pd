function [testData] = GenerateTestData()
    disp('Reading raw data');
    data = csvread('RawData.csv',1, 3);
    disp('Reading tags');
    tags = csvread('tags.csv',0,1);
    tags = tags(:,1:2);
    disp('Setting tags');
    
    taggedActivities = cell(20,1);
    
    %The number had to be hardcoded because the data collected is not symmetric 
    %and a few activities are missing in the second set of activities
    count = 1;
    for t=23:42
      taggedActivities{count} = data((tags(t,1)+1):tags(t,2),1:3);
      count = count + 1;
    end
    
    %Each entry of this cell is a cell object which contains each activity
    %split into 10s intervals
    sequencedListOfTestActivities = cell(20,1);
    totalNumberOfTimeSlices = 0;
    for i=1:size(sequencedListOfTestActivities,1)
        sequencedListOfTestActivities{i} = DivideIntoIntervals(taggedActivities{i},10);
        totalNumberOfTimeSlices = totalNumberOfTimeSlices + size(sequencedListOfTestActivities{i},2);
    end
    
    %Prepare the test data. What we are doing is, we are iterating through
    %the sequencedListOfTestActivities and appending each 10s interval to
    %test data along with the label
    keys = {'Standing', 'Walking', 'Walking while counting', 'Going up stairs', 'Going down stairs',... 
        'Walk through a narrow passageway', 'Finger to nose - right hand', 'Finger to nose - left hand',...
        'Finger to nose - right hand', 'Finger to nose - left hand', 'Alternating right hand movements',...
        'Alternating left hand movements', 'Alternating right hand movements',...
        'Alternating left hand movements','Sit to stand',...
        'Drawing and writing on a paper','Typing on computer keyboard',...
        'Assembling nuts and bolts','Take a glass of water & drink',...
        'Organize sheets in folder','Folding towels','Sitting'};
    values = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22};
    classLabels = containers.Map(keys,values);
    count = 1;
    testData = cell(totalNumberOfTimeSlices,2);
    for i=1:size(sequencedListOfTestActivities,1)
        for j=1:size(sequencedListOfTestActivities{i},2)
            testData{count,1} = sequencedListOfTestActivities{i}{j};
            %this condition is required because test data is not symmetric
            %with training data
            if(i > 3)
                testData{count,2} = i + 2;
            else
                testData{count,2} = i;
            end
            count = count + 1;
        end
    end
end