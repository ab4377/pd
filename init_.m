function centroid = init_(profiles)
% initialization for each centroid.
fx = [];
fy = [];
fz = [];
centroid = cell(3,1);

for i = 1:size(profiles,1)
    cur = profiles{i};
    fx = union(fx, cur{1}(:,1));
    fy = union(fy, cur{2}(:,1));
    fz = union(fz, cur{3}(:,1));
end

xpara = cat(2,fx,rand(size(fx,1),1),rand(size(fx,1),1));
ypara = cat(2,fy,rand(size(fy,1),1),rand(size(fy,1),1));
zpara = cat(2,fz,rand(size(fz,1),1),rand(size(fz,1),1));

centroid{1} = xpara;
centroid{2} = ypara;
centroid{3} = zpara;

end