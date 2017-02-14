function distance = getDist (profile, centroid, type)
% distance is the distance between one profile and one centroid.
% profile is a 3x1 cell, the same as centroid.

% get the union of frequencies for profile and centroid in xyz axes.
distance = 0;

% if strcmp(type,'Coherence')
%     distance = getCohDist(cell2mat(profile),cell2mat(centroid));
% end

if strcmp(type,'l2')
    for i =1:3
        distance = distance + distAccum(profile{i},centroid{i});
    end
end


end