function [ fxi,fyi,fzi ] = getUnifiedPeaks_old(s1,s2)
%GETUNIFIEDPEAKS Summary of this function goes here
%   Detailed explanation goes here
% x is the amplitude, and f is the frequencies.
[ x1,f1] = freqAnalysis( s1 );
[ x2,f2] = freqAnalysis( s2 );
fxi=[];
fyi=[];
fzi=[];

[pks1,loc1]=findpeaks(x1(:,1),f1,'MinPeakProminence',0.002,'MinPeakDistance',0.05);
fxi=union(fxi,nonzeros(loc1.*(loc1<7 & loc1>0)));
[pks1,loc1]=findpeaks(x1(:,2),f1,'MinPeakProminence',0.002,'MinPeakDistance',0.05);
fyi=union(fyi,nonzeros(loc1.*(loc1<7 & loc1>0)))
[pks1,loc1]=findpeaks(x1(:,3),f1,'MinPeakProminence',0.002,'MinPeakDistance',0.05);
fzi=union(fzi,nonzeros(loc1.*(loc1<7 & loc1>0)));

[pks2,loc2]=findpeaks(x2(:,1),f2,'MinPeakProminence',0.002,'MinPeakDistance',0.05);
fxi=union(fxi,nonzeros(loc2.*(loc2<7 & loc2>0)));
[pks2,loc2]=findpeaks(x2(:,2),f2,'MinPeakProminence',0.002,'MinPeakDistance',0.05);
fyi=union(fyi,nonzeros(loc2.*(loc2<7 & loc2>0)));
[pks2,loc2]=findpeaks(x2(:,3),f2,'MinPeakProminence',0.002,'MinPeakDistance',0.05);
fzi=union(fzi,nonzeros(loc2.*(loc2<7 & loc2>0)));
end

