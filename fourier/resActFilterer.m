% this script filters
% restActs
filteredRestActs={};
lpFilt = designfilt('lowpassiir','FilterOrder',8, ...
         'PassbandFrequency',0.5,'PassbandRipple',0.1, ...
         'SampleRate',30);
for i=1:length(restActs)
    x=cell2mat(restActs(i));
    xf=filter(lpFilt,x);
    filteredRestActs{i}=xf;
end;