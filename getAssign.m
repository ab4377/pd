function assignment = getAssign (profile, centroids)
% assign one profile to a cluster based on the distance to each centroid.
distances = getDistances(profile,centroids);

[minDist,pos] = min(distances);
assignment = pos;

end