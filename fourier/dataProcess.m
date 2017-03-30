% Out of the 42 activities, 40 are duplicate of each other. There are 
% effectively 22 activites. This script merges those repeated activities.

len = length(tagged);
activityNum = transpose(1:len);
activityLength = zeros(len,1);

for i=1:len
    activityLength(i) = length(tagged{i});
end

activityInfo = table(activityNum, activityLength);

% Create batches, each representing a time slice of 4 seconds, for each activity
batches = cell(len, 1); % batches = array that stores the batches for each 
                        % activity in a single cell

batch_l = 500; % set batch length                        
for act=1:len
    tot_l=activityLength(act); %total length of raw data for the current activity
    batch_num = floor(tot_l/batch_l); % batch_num = number of batches that will be generated 
                                    % for current activity
    batches{act} = cell(1, batch_num); % batches{act} = cell array containing 
                                       % the batches that will be generated
    for t=1:batch_num
        % batches{act}{t} = cell array that represents a batch,
        % containing the accelerometer data for that batch and a 
        % corresponding label that indicates that activity being performed
        % during the batch.
        batches{act}{t} = cell(1,2); 
        batches{act}{t}{1,1} = act;
        batches{act}{t}{1,2} = tagged{act}( ((t-1)*batch_l+1):(t*batch_l),:);
    end
        
    save('batches.mat','batches');
end