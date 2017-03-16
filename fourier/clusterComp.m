function [clusterComp] = analyzeCluster(nclus, assigns, labels, num_acts, cnt_list)
% examine at the composition of the clusters
clusterComp = zeros(nclus, num_acts+1);
% cluster_comp is the matrix of cluster compostion. Each row represents 
% the composition of a cluster. Each column represents the proportion that 
% an activity takes up in each the clusters.

for i = 1:length(assigns)
    clusterComp(assigns(i), labels(i)) = clusterComp(assigns(i), labels(i)) + 1;
end

for i = 1:length(nclus)
    clusterComp(i, num_acts + 1) = cnt_list(i);
end

end