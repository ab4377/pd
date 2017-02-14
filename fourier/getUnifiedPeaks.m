function [ x1, s_para, f1 ] = getUnifiedPeaks(s1)
% This function calculates the FFT of s1 (acceleration data in 
% time space). Then, the function gets the peaks from the 
% frequency space. The function returns [x1, s_para, f1], with 
% [x1, f1] being the frequency space of s1 and s_para containg the 
% peaks in the frequency space. 
[x1, f1] = freqAnalysis( s1 );
s_para = getPeaks(x1,f1);
end

