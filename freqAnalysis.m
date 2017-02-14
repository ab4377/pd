% This function uses the fast fourier transform to transform the 
% accelerator data from the time domain to the frequency domain
function [ x,f] = freqAnalysis( a )

% get length of data  
n=length(a);

% set sampling frequency and times: frequency is 50Hz, and the time (interval) is
% 1/50 = 0.02 secs
fs=50;
ts=1/fs;

L=n;

% Transform the data using Fast Fourier transform. This will 
% return the Fourier transform for each vector x,y,z in the acceleration 
% data
y=fft(a);

%
P2 = abs(y/L); % P2 is the two-sided amplitude spectrum (it's divided 
               % by L because it's a feature of MATLAB's fft that 
               % they don't divide by L.
P1 = P2(1:L/2+1,:); % Get the one-sided amplitude spectrum, since the 
                    % amplitude spectrum is one-sided.
 

P1(2:end-1,:) = 2*P1(2:end-1,:); % Multiply amplitude by 2 to get the
                                 % "T
x=P1;
f=fs*(0:L/2)/L; % generate a vector of frequency
f=f.'; %transposing the frequency array
end
%[x,y]=mscohere(c1,c2,hamming(50),20,fi,50)