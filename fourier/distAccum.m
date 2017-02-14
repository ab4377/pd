function dist = distAccum (p1x, p2x)
%%%%%% change the peak distance part %%%%%%

dist = 0;
f1 = p1x(:,1);
f2 = p2x(:,1);
%fx = union(f1,f2);
align1 = ismember(f1,f2);
align2 = ismember(f2,f1);

for i = 1:size(f1,1)
    if align1(i) == 1
        idx = find(f2==f1(i));
        if ~isequal(size(p1x(i,:)),size(p2x(idx,:)))
            fprintf('Errors.\n');
        end
        dist = dist + peakDist(p1x(i,:),p2x(idx,:)); %%%%%%
    else
        dist = dist + pemalty(p1x(i,:)); %%%%%%
    end
end

for i = 1:size(f2,1)
    if align2(i)==0
        dist = dist + pemalty(p2x(i,:)); %%%%%%
    end
end

end