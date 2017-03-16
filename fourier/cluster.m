load('batches.mat');

% extract labels and accelerometer data from `batches`  
num_acts = length(batches);
batchData = {}; % cell array storing batches
batchLabels = []; % array of labels for batches
batch_count = 0; % count the number of batches
sample_size = 4; % sample size for each activity 
for i = 1:num_acts
    sample = min(sample_size, length(batches{i}));
    for j = 1:sample
        batch_count = batch_count + 1;
        batchLabels(batch_count) = batches{i}{j}{1,1};
        batchData{batch_count} = batches{i}{j}{1,2};
    end
end

nclus = 22;
[assigns, centroids, cnt_list] = getKMeans(batchData, nclus);

clusterComp = analyzeCluster(nclus, assigns, batchLabels, num_acts, cnt_list);