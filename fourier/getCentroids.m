function centroids = getCentroids (profiles, assigns, ffts, ft)
%=============================================================%
% This function reassigns the centroids based on the assigments
%========================PARAMETERS============================
% 1. profiles: array of profiles
% 2. assigns: array for the assignment of profiles. The number in i-th position in 
% the array stores the cluster assignment of the i-th profile in `profiles`
% 3. ffts: array of the fast fourier transforms (fft) from which the profiles are
% extracted. 
% 4. ft: frequency spectrum for the fft.
%+==============================================================

%===intialization===
assign_list = unique(assigns);  
nclus = size(assign_list,2); % nclus = number of clusters
centroids = cell(3,nclus); % centroids = 3 x nclus matrix storing  
                           % the position of each centroid

%===calculate centroids===
% Note that the centroids are calculated by averaging the ffts of 
% the profiles in each clusters to form a frequency space for the centroid 
% and then extracting the peak profile of that frequency space as the profile 
% of the centroid. 

for i = 1:nclus
    centroids(:,i) = getCentroid(ffts(assigns==assign_list(i)),ft);
end

end