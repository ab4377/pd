function peak_dist = peakDist(param1, param2)
% param1 & param2 are 1x3 arrays
%%%%%% change the peakDist function %%%%%

err = param1 - param2;
peak_dist = norm(err); % l2 norm


end