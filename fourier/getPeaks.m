% this function extract peaks from the fourier transform 
function [peakPara] = getPeaks (x1, f1)

% get peaks for x  
[pks1,loc1,wid1,p1]=findpeaks(x1(:,1),f1,'MinPeakProminence',0.002,'MinPeakDistance',0.05);
% Get peaks with frequency between 0 and 7 
fx=nonzeros(loc1.*(loc1 < 7 & loc1 > 0));
pksx=nonzeros(pks1.*(loc1<7 & loc1>0));
widx=nonzeros(wid1.*(loc1<7 & loc1>0));
disp(pks1);

% get peaks for y  
[pks1,loc1,wid1,p1]=findpeaks(x1(:,2),f1,'MinPeakProminence',0.002,'MinPeakDistance',0.05);
% Get peaks with frequency between 0 and 7 
fy=nonzeros(loc1.*(loc1<7 & loc1>0));
pksy=nonzeros(pks1.*(loc1<7 & loc1>0));
widy=nonzeros(wid1.*(loc1<7 & loc1>0));

% get peaks for z 
[pks1,loc1,wid1,p1]=findpeaks(x1(:,3),f1,'MinPeakProminence',0.002,'MinPeakDistance',0.05);
% Get peaks with frequency between 0 and 7 
fz=nonzeros(loc1.*(loc1<7 & loc1>0)); 
pksz=nonzeros(pks1.*(loc1<7 & loc1>0));
widz=nonzeros(wid1.*(loc1<7 & loc1>0));

% Return the results: prominent peaks of amplitude between 0 and 7 for x,
% y, z
peakPara = cell(3,1);
peakPara{1} = table(fx,pksx,widx, 'VariableNames', {'fx', 'pksx', 'widx'});
peakPara{2} = table(fy,pksy,widy, 'VariableNames', {'fy', 'pksy', 'widy'});
peakPara{3} = table(fz,pksz,widz, 'VariableNames', {'fz', 'pksz', 'widz'});

end