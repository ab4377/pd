function [ dist ] = getCohDist(s1,s2)
%GETCOHDIST Summary of this function goes here
%   Detailed explanation goes here
[ fxi,fyi,fzi ] = getUnifiedPeaks_old(s1,s2);
[x,y]=mscohere(s1,s2,hamming(50),20,fxi,50);
mx=mean(x(:,1));
[x,y]=mscohere(s1,s2,hamming(50),20,fyi,50);
my=mean(x(:,2));
[x,y]=mscohere(s1,s2,hamming(50),20,fzi,50);
mz=mean(x(:,3));
dist=(3-mx-my-mz)*100;

end

