function [ taggedActivities ] = FindingOptLambda()

    % FindingOptLambda is used to find the optimal noise cancellation parameter, 
    % a parameter which is used in EMD calculated
    
    disp('Reading raw data');
    data = csvread('RawData.csv', 1, 3);
    disp('Reading tags');
    tags = csvread('tags.csv', 0, 1);
    tags = tags(:,1:2);
    disp('Setting tags');
    %ntags = length(tags);
    
    %we are hardcoding the size of the cell because the data in tags file
    %is not symmetric
    taggedActivities = cell(22,1);
    
    %The number had to be hardcoded because the data collected is not symmetric 
    %and a few activities are missing in the second set of activities 
    for t=1:22
      taggedActivities{t} = data((tags(t,1)+1):tags(t,2),1:3);
    end
    
    %Each entry of this cell is a cell object which contains each activity
    %split into 10s intervals
    sequencedListOfActivities = cell(22,1);
    for i=1:size(sequencedListOfActivities,1)
        sequencedListOfActivities{i} = DivideIntoIntervals(taggedActivities{i},10);
    end
    
    testData = GenerateTestData();
    error = 0;
    [m,~] = size(testData);
    %disp(size(testData,1));
    %disp(m);
    noiseCancellationParameter = [0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09];
    errors = containers.Map();
    for index=1:size(noiseCancellationParameter,2)
        error = 0;
        for i=1:m
            [label,~] = ClassifyTestDataPoint(sequencedListOfActivities,testData{i,1},noiseCancellationParameter(index));
            %disp('Actual label');
            %disp(testData{i,2});
            %disp('Predicted Label');
            %disp(label);
            if(label ~= testData{i,2})
                error = error + 1;
            end
        end
        errors(num2str(noiseCancellationParameter(index))) = num2str(error/m);
        %str = strcat('lamdba = ',noiseCancellationParameter(index),'Classifier error = ',num2str(error/m));
        %disp(str);
    end
    k = keys(errors) ;
    val = values(errors) ;
    for i = 1:length(errors)
        str = strcat('lambda',k{i},' error = ',val{i});
        disp(str);
    end
    %     frequency = 50;
    %     numberOfSeconds = 10;
    %     %noiseCancellationParameter = [0.01,0.03,0.05,0.07,0.09];
    %     noiseCancellationParameter = [0.01];
    %     arrayOfDistances = cell(numel(noiseCancellationParameter),1);
    %
    %     %     for idx=1:numel(noiseCancellationParameter)
    %     %         tenSecondDistanceGroupedByActivity = {};
    %     %         for i=1:size(taggedActivities,2)
    %     %             %disp(size(taggedActivities{i}));
    %     %             tenSecondDistanceGroupedByActivity{i} = TenSecondIntervalDistance(taggedActivities{i},noiseCancellationParameter(idx));
    %     %             %break;
    %     %         end
    %     %         arrayOfDistances{idx} = tenSecondDistanceGroupedByActivity';
    %     %     end
    %     for idx=1:numel(noiseCancellationParameter)
    %         str = strcat('Using lambda as ',num2str(noiseCancellationParameter(idx)));
    %         disp(str);
    %         arrayOfDistances{idx} = TenSecondIntervalDistance(data,noiseCancellationParameter(idx));
    %         %arrayOfDistances{idx} = tenSecondDistanceGroupedByActivity';
    %     end
end

