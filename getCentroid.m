function centroid = getCentroid (ffts, ft)
% Average of the ffts in a cluster to get the centroid.
fx = ffts{1}(:,1); 
fy = ffts{1}(:,2);
fz = ffts{1}(:,3);
cnt = size(ffts,1);

for i = 2:cnt
    fx = fx + ffts{i}(:,1);
    fy = fy + ffts{i}(:,2);
    fz = fz + ffts{i}(:,2);
end
fx = fx/cnt;
fy = fy/cnt;
fz = fz/cnt;
x = cat(2,fx,fy,fz);
centroid = getPeaks(x,ft);

% % get union of frequencies in xyz.
% for i = 1:size(profiles,1)
%     cur = profiles{i};
%     fx = union(fx, cur{1}(:,1));
%     fy = union(fy, cur{2}(:,1));
%     fz = union(fz, cur{3}(:,1));
% end
% 
% % add parameters for frequences.
% % cnt = zeros(size(fx,1),1);
% % for i = 1:size(profiles,1)
% %     cur = profiles{i};
% %     cnt = cnt + ismember(fx, cur{1}(:,1));
% %     
% % end
% 
% params = meanPara(fx,profiles,1);
% centroid{1} = params;
% params = meanPara(fy,profiles,2);
% centroid{2} = params;
% params = meanPara(fz,profiles,3);
% centroid{3} = params;


end