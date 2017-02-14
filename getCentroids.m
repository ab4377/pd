function centroids = getCentroids (profiles, assigns, ffts, ft)

assign_list = unique(assigns);
nclus = size(assign_list,2);
centroids = cell(3,nclus);

for i = 1:nclus
    centroids(:,i) = getCentroid(ffts(assigns==assign_list(i)),ft);
end

end