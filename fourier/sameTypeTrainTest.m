% This script generates arrays of training and testing data
% and their correct responses
Acts=restActs;
cl=length(Acts);

bulk=cell2mat(Acts(1));
bl=length(bulk);
testl=floor(bl*0.1);
ri=randperm(bl);
trainin=bulk(ri(testl+1:end),:);
trainout=ones((bl-testl),1).*1;
testin=bulk(ri(1:testl),:);
testout=ones((testl),1).*1;
%trainin=trainin';
%testin=testin';
for i=2:cl
    bulk=cell2mat(Acts(i));
    bl=length(bulk);
    testl=floor(bl*0.1);
    ri=randperm(bl);
%     size(trainin)
%     size(bulk(ri(testl+1:end),:))
    trainin=vertcat(trainin,bulk(ri(testl+1:end),:));
    trainout=vertcat(trainout,(ones((bl-testl),1).*i));
    testin=vertcat(testin,(bulk(ri(1:testl),:)));
    testout=vertcat(testout,(ones((testl),1).*i));  
end;