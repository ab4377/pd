function assignments = getAssigns(profiles, centroids, nclus, type)
% =================================================================
% This function assigns calculates the distance from each profile to 
% the centroids and assign each profile to a centroid based on that 
% distance.
% ========================PARAMETERS==============================
% 1. profiles: array of profiles
% 2. centroids: array of current centroids
% 3. nclus: number of clusters
% 4. type: type of distance used
% ========================RETURN VALUE=============================
% The function returns an array that specifies the cluster to which 
% each profile belongs
% =================================================================
len = size(profiles,1); % len = number of profiles
assignments = zeros(1,len); % assignments = array that specify the cluster 
                            % to which a profile belongs
assign_dist = zeros(nclus,len); % assign_dist = matrix of distance between
                                % clusters and points. rows represent
                                % clusters. columns represent profiles
clus = 1:nclus; % clus = array from 1 to nclus (nclus = number of clusters)


% assign each profile to its closest cluster
for i = 1:len
    assign_dist(:,i) = getDistances(profiles{i},centroids,type); 
    [min_,assignments(i)] = min(assign_dist(:,i));
end

end