function [XTrain,yTrain,XTest,yTest] = GenerateTrainingDataForBinaryClassifier()
    %this function is used to generate data for binary classifier
    %class labels are +1 and -1
    X1 = GenerateData('Data/Avinash/avinash-sitting.csv');
    %X1 = [X1;GenerateData('Data/Avinash/avinash-upstairs-2.csv')];
    
    X2 = GenerateData('Data/Avinash/avinash-walking-raw.csv');
    %X2 = [X2;GenerateData('Data/Avinash/avinash-downstairs-2.csv')];
    [m,~] = size(X1);
    trainSize = floor(0.7*m);
    X1Test = X1(trainSize+1:end,:);
    X1Train = X1(1:trainSize,:);
    clear X1;
    
    [m,~] = size(X2);
    trainSize = floor(0.7*m);
    X2Test = X2(trainSize+1:end,:);
    X2Train = X2(1:trainSize,:);
    clear X2;
    
    XTrain = [X1Train;X2Train];
    XTest = [X1Test;X2Test];
    [m,~] = size(XTrain);
    yTrain = -1*ones(m,1);
    yTrain(1:size(X1Train,1)) = 1;
    [m,~] = size(XTest);
    yTest = -1*ones(m,1);
    yTest(1:size(X1Test,1)) = 1;
end