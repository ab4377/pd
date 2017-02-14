function assignments = getAssigns(profiles, centroids, nclus, type)
len = size(profiles,1);
assignments = zeros(1,len);
assign_dist = zeros(nclus,len);
clus = 1:nclus;

% for i = 1:len
%     assignments(i) = getAssign(profiles{i},centroids);
% end
for i = 1:len
    assign_dist(:,i) = getDistances(profiles{i},centroids,type);
    [min_,assignments(i)] = min(assign_dist(:,i));
end

% if size(unique(assignments),2) ~= nclus
%     pIdx = zeros(nclus,1);
%     for i = 1:nclus
%         [min_,idx] = min(assign_dist(i,:));
%         if ismember(idx,pIdx)
%             [b,sort_] = sort(assign_dist(i,:));
%             ptr = 2;
%             while (ptr<=len)
%                 if ~ismember(sort_(ptr),pIdx)
%                     break;
%                 end
%                 ptr = ptr + 1;
%             end
%             pIdx(i) = sort_(ptr);
%         else
%             pIdx(i) = idx;
%         end
%     end
%     for i = 1:nclus
%         assignments(pIdx(i)) = i;
%     end
% end


end