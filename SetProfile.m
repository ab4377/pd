function [new_profile] = SetProfile(profile,f_t)
new_profile = cell(3,1);

for i = 1:3
    % i is the index of xyz axes.
    set_f = f_t(:,i);
    cur_f = profile{i}(:,1);
    flag = ismember(cur_f,set_f);
    cur = profile{i}(flag==1,:);
    fn_ = set_f(~ismember(set_f, cur_f));
    len = size(fn_,1);
    para = zeros(len,3);
    para(:,1) = fn_;
    para = cat(1,cur,para);
    new_profile{i} = para;
end
end