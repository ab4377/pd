function [peakPara] = getPeaks (x1, f1)
%==========================================================================
% This function extract peaks from the fast fourier transform.
%==============================PARAMETERS==================================
% 1. x1: frequency spectrum
% 2. f1: amplitude at each frequency
%========================RETURN VALUES=====================================
% Returns a cell array, each containing a matrix. The matrix in the cell
% arrays are the peak location, peak width, and peak amplitude for each 
% frequency.
%==========================================================================

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
peakPara{1} = cat(2,fx,pksx,widx);
peakPara{2} = cat(2,fy,pksy,widy);
peakPara{3} = cat(2,fz,pksz,widz);

end