function centroid = getCentroid (ffts, ft)
%==================================================================
% This function averages the ffts in a cluster to get the centroid
% of that cluster. It then uses the function getPeaks() to 
% generate a peak profile for that centroid. 
% ========================PARAMETERS==============================
% 1. ffts: fast fourier transform of the profiles in the cluster
% 2. ft: frequency spectrum of the fft
% ========================RETURN VALUE=============================
% The function returns a peak profile of the calculated centroid
% =================================================================

% === Get the average of the ffts of the profiles in cluster ===
fx = ffts{1}(:,1); 
fy = ffts{1}(:,2);
fz = ffts{1}(:,3);  
cnt = size(ffts,1);

for i = 2:cnt
    fx = fx + ffts{i}(:,1);
    fy = fy + ffts{i}(:,2);
    fz = fz + ffts{i}(:,2);
end

% fx = average of ftts of all profiles in the x-axis = frequency space of the 
% x-axis of the centroid
% fY = average of ftts of all profiles in the y-axis = frequency space of the 
% y-axis of the centroid
% fz = average of ftts of all profiles in the z-axis = frequency space of the 
% z-axis of the centroid
fx = fx/cnt;
fy = fy/cnt;
fz = fz/cnt;

x = cat(2,fx,fy,fz); 

%=== Extract the peak profiles from the ffts ===
centroid = getPeaks(x,ft);


end