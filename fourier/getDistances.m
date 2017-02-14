function distances = getDistances (profile, centroids, type)
% distances is an array of distances between one profiles to each centroid.
nclus = size(centroids,2);
distances = zeros(nclus,1);

for i = 1:nclus
    distances(i) = getDist(profile,centroids(:,i),type);
end

end