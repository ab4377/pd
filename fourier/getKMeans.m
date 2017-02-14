function [ assigns, centroids, cnt_list ] = getKMeans( pts, clus )
% pts is the container for samples, each is a 3d array. The samples are
% accelerometer data in time space. 
% clus is the number of clusters
n=length(pts);

% profiles are a list of profile with {frequency, peak, width} in xyz axes.
% ffts are the frequency space (containing the fourier transforms). 
% The ith-sample is going to have its fft stored in fft{i} and its peaks 
% profile stored in profiles{i}.
profiles = cell(n,1); 
ffts = cell(n,1);
ft = [];
t_num = 15; % the number of top frequencies.

% for all samples
for i=1:n
    % extract peaks from each sample
    [fs,s_para,ft] = getUnifiedPeaks(cell2mat(pts(i)));
    profiles{i}=s_para; % store the peak profile in profiles{i} 
    ffts{i} = fs; % store the fft in ffts{i}
end

% get the top t_num frequentest frequencies in xyz axes.
cnt = zeros(size(ft,1),3);
for i = 1:n
    fx = profiles{i}{1}(:,1);         
    fy = profiles{i}{2}(:,1);
    fz = profiles{i}{3}(:,1);
    cnt(:,1) = cnt(:,1) + ismember(ft,fx);
    cnt(:,2) = cnt(:,2) + ismember(ft,fy);
    cnt(:,3) = cnt(:,3) + ismember(ft,fz);
end
[cnt_,idx_] = sort(cnt,'descend');
fx_t = ft(idx_(:,1));
fx_t = fx_t(1:t_num);
fy_t = ft(idx_(:,2));
fy_t = fy_t(1:t_num);
fz_t = ft(idx_(:,3));
fz_t = fz_t(1:t_num);
f_t = cat(2,fx_t,fy_t,fz_t);

for i = 1:n
    profiles{i} = SetProfile(profiles{i},f_t);
end

% initialization.
prev_assigns = randi([1,clus],1,n);
assigns = randi([1,clus],1,n);
% while (size(unique(assigns),2) < clus)
%     assigns = randi([1,clus],1,n);
% end
centroids = cell(3,clus); % col: one centroid on xyz axes with {freq,pks,width}.
% for i = 1:clus
%     centroids(:,i) = init_(profiles(assigns==i));
% end
pos = randperm(n,clus);
for i = 1:clus
    centroids(:,i) = profiles{pos(i)};
end

% updates.
epoch = 1;
while(~isequal(prev_assigns,assigns) && epoch <=1000)
    fprintf('The epoch is %d.\n', epoch);
    prev_assigns = assigns;
    assigns = getAssigns(profiles,centroids,size(centroids,2),'l2');
    centroids = getCentroids(profiles,assigns,ffts,ft);
    fprintf('The size of clusters is %d.\n', size(unique(assigns),2));
    epoch = epoch + 1;
end

fnclus = size(unique(assigns),2);
cnt_list = zeros(fnclus,1);
for i = 1:fnclus
    cnt_list(i) = sum(assigns==i);
end

end

