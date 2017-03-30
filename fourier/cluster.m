function [clusterComp, batchInfo, batchData, top_freq] = cluster(batches, nclus, sample_size)
% extract labels and accelerometer data from `batches`  
num_acts = length(batches);
batchData = {}; % cell array storing batches
batchLabels = []; % array of labels for batches
batch_count = 0; % count the number of batches
for i = 1:num_acts
    sample = min(sample_size, length(batches{i}));
    for j = 1:sample
        batch_count = batch_count + 1;
        batchLabels(batch_count) = batches{i}{j}{1,1};
        batchData{batch_count} = batches{i}{j}{1,2};
    end
end

[assigns, centroids, cnt_list, top_freq] = getKMeans(batchData, nclus);

[clusterComp, batchInfo] = analyzeCluster(nclus, assigns, batchLabels, num_acts, cnt_list);

end