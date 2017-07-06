function [new_profile] = SetProfile(profile,f_t)
%==========================================================================
% This function constructs new profiles from the old profiles. It takes the
% 15 frequencies at which peaks appear the most in all profiles. 
% Then, it goes through each profile again and gathers the peak amplitudes 
% and peak widths for those frequencies (if they appear) 
%==============================PARAMETERS==================================
% 1. x1: frequency spectrum
% 2. f1: amplitude at each frequency
%========================RETURN VALUES=====================================
% Returns a cell array, each containing a matrix. The matrix in the cell
% arrays are the peak location, peak width, and peak amplitude for each 
% frequency.
%==========================================================================

new_profile = cell(3,1);

% profiles = the samples
% f_t = the most-occured peak frequencies for x,y,z axis

for i = 1:3 % for each axis x, y, z (corresponding to i = 1, 2, 3)
    set_f = f_t(:,i); % set_f = the most occured peak frequencies for the current axis
    cur_f = profile{i}(:,1); % cur_f = the peak frequencies of the current sample for 
                             % the current axis
                  
    % cur = the peak frequency, amplitude, and width of the 
    % peak frequencies in both cur_f and set_f
    flag = ismember(cur_f,set_f); 
    cur = profile{i}(flag==1,:);
    
    % fn_ = the peak frequencies in set_f but not in cur_f
    fn_ = set_f(~ismember(set_f, cur_f));
    len = size(fn_,1);
    
    % para is the new profile for the sample, which contains the 
    % information about the occurence of peak frequencies 
    % in the set f_t, the most occured peak frequencies
    % in all samples in the current sample. The 1st column of para contains
    % the frequencies in f_t. The 2nd column contains the peak amplitudes of
    % the frequencies in f_t in the current sample. The 3rd column contains
    % the peak widths of the frequencies in f_t in the current sample.
    
    % If a peak frequency in f_t occured in the current sample, we 
    % store its peak width and peak amplitude in para. If a peak frequency in  
    % f_t does not occur in this sample, we let its peak width and peak
    % amplitude be 0.
    para = zeros(len,3);
    para(:,1) = fn_;
    para = cat(1,cur,para);
    new_profile{i} = para;
end
end