% this script reads data from 'RawData.csv' and 'tags.csv'
% and preprocesses them. 
% 'RawData.csv' contains the accelerometer data measured 
% at 50 Hz for 41 activities. 'tags.csv' contains the 
% the observation number at which an activity starts to be 
% measured and the observation number at which measurement 
% for that activity ends. 

disp('reading raw data');
data = csvread('RawData.csv',1, 3);
disp('reading tags');
tags = csvread('tags.csv',0,1);
tags = tags(:, 1:2);
disp('setting tags');
ntags = length(tags);
tagged = {};

% Matching the tags with the raw data -- the tagged 
% array will contain accelerometer data for 22 separate 
% activities. The tagged.csv file contains 42 activities, but 40 of them 
% are just duplicates of each other.
for t=1:22
  if ( (t >= 1) && (t <= 3) )
    tagged{t}= data([ (tags(t,1)+1):tags(t,2) (tags(t+22,1) + 1): tags(t+22,2)] , :);
  elseif ( (t >= 6 ) && ( t <= 22)) 
    tagged{t}= data([ (tags(t,1)+1):tags(t,2) (tags(t+20,1) + 1): tags(t+20,2)] , :);
  else 
    tagged{t} = data((tags(t,1)+1):tags(t,2),:);
  end
end

%{
% Batch the time series into batches of batch_l observations
% which is approximately (1/50) sec * 1000 = 20 secs.
tot_l=length(data); %total length of raw data
batch_l = 1000; % set batch length
batched = {}; % array of batches 
for t=1:floor(tot_l/batch_l)
    batched{t} = data( ((t-1)*batch_l+1):t*batch_l,:);
end
%}