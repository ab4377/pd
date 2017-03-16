function [ assigns, centroids, cnt_list ] = getKMeans( pts, clus )
%=============================================================%
% This function performs k-means clustering using time slices as points
%========================PARAMETERS==============================
% 1. pts: the container for the time slices, each is an array containing
% accelerometer data in time space. 
% 2. clus: the number of clusters
%========================RETURN VALUES===========================
% 1. assigns: array of cluster assignment for each time slice
% 2. centroids: an array containg the peak profiles of each centroid
% 3. cnt_list: an array containing the number of time slices in each
% cluster
%================================================================

%===constructing profile===

% profiles = list of profile with {frequency, peak, width} in xyz axes.
% ffts = the frequency space (containing the fourier transforms). 
% The ith-sample is going to have its fft stored in fft{i} and its peaks 
% profile stored in profiles{i}.
n=length(pts);
profiles = cell(n,1); 
ffts = cell(n,1);
ft = []; % frequency array
t_num = 15; % the number of top frequencies.

% for all samples
for i=1:n
    % extract peaks from each sample
    [fs,s_para,ft] = getUnifiedPeaks(cell2mat(pts(i)));
    profiles{i}=s_para; % store the peak profile in profiles{i} 
    ffts{i} = fs; % store the fft in ffts{i}
end

% get the top t_num frequentest frequencies in xyz axes.
% cnt store all the peak frequencies(the frequencies at which peaks occur)
cnt = zeros(size(ft,1),3); 
for i = 1:n
    fx = profiles{i}{1}(:,1); % fx is the peak frequencies for x        
    fy = profiles{i}{2}(:,1); % fy is the peak frequencies for y
    fz = profiles{i}{3}(:,1); % fz is the peak frequencies for z
    
    % store the number of occurences of peak frequencies in cnt:
    % 1. the i-th row of cnt contains the number of times the i-th peak frequency
    % occurs for the x-dimension, y-dimension, and z-dimension. The i-th
    % peak frequency is the frequency found in the i-th position of the ft
    % array.
    
    % 2. the i-th column of cnt contains the number of occurence of 
    % peak frequencies in the i-th dimension. There are 3 columns -- 
    % 1 corresponding to x, 2 corresponeding to y, 3 corresponding to z.
    
    cnt(:,1) = cnt(:,1) + ismember(ft,fx);
    cnt(:,2) = cnt(:,2) + ismember(ft,fy);
    cnt(:,3) = cnt(:,3) + ismember(ft,fz);
end

% sort the occurences of the peak frequencies and store the info in f_t. 
% f_t contains three columns: the first column is fx_t, the t_num most
% occured peak frequency in the x-axis, the second is fy_t, the t_num most
% occured peak frequency in y-axis, and the third fz_t, the t_num most
% occured peak frequency in z-axis.
[cnt_,idx_] = sort(cnt,'descend');
fx_t = ft(idx_(:,1));
fx_t = fx_t(1:t_num);
fy_t = ft(idx_(:,2));
fy_t = fy_t(1:t_num);
fz_t = ft(idx_(:,3));
fz_t = fz_t(1:t_num);
f_t = cat(2,fx_t,fy_t,fz_t);

% create new profiles
for i = 1:n
    profiles{i} = SetProfile(profiles{i},f_t);
end

%===initialization===

% assign points to centroids
prev_assigns = randi([1,clus],1,n);
assigns = randi([1,clus],1,n);
centroids = cell(3,clus); % col: one centroid on xyz axes with {freq,pks,width}.

% intialize the centroids
pos = randperm(n,clus);
for i = 1:clus
    centroids(:,i) = profiles{pos(i)};
end

%===k-means===
epoch = 1000; % epoch is the number of iterations run by the clustering
while(~isequal(prev_assigns,assigns) && epoch <=1000)
    fprintf('The epoch is %d.\n', epoch);
    prev_assigns = assigns;
    assigns = getAssigns(profiles,centroids,size(centroids,2),'l2'); % assign points to centroids
    centroids = getCentroids(profiles,assigns,ffts,ft); %recalculate centroids
    fprintf('The size of clusters is %d.\n', size(unique(assigns),2));
    epoch = epoch + 1;
end

%===count the number of time slices in each cluster===
for i = 1:clus
    cnt_list(i) = sum(assigns==i);
end
%=====================================================

end

