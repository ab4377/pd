function params = meanPara (fx, profiles, xyz)
%%%%%% change for mean para calculation %%%%%%%
pks = zeros(size(fx));
wid = zeros(size(fx));

cnt = zeros(size(fx,1),1);
for i = 1:size(profiles,1)
    cur = profiles{i};
    flag = ismember(fx, cur{xyz}(:,1));
    for j = 1:size(fx,1)
        if flag(j) == 1
            pks(j) = pks(j) + cur{xyz}(cur{xyz}(:,1)==fx(j),2);
            wid(j) = wid(j) + cur{xyz}(cur{xyz}(:,1)==fx(j),3);
        end
    end
    cnt = cnt + flag;
end

pks = pks./cnt;
wid = wid./cnt;
params = cat(2,fx,pks,wid);

end