function [XTrain,yTrain,XTest,yTest] = GenerateTrainingDatav2()
    
    X2 = GenerateData('Data/Avinash/avinash-standing.csv');
    
    X4 = GenerateData('Data/Avinash/avinash-sit-to-stand-1.csv');
    X4 = [X4;GenerateData('Data/Avinash/avinash-sit-to-stand-2.csv')];
    
    X5 = GenerateData('Data/Avinash/avinash-sitting.csv');
    X6 = GenerateData('Data/Avinash/avinash-walking-raw.csv');
    X7 = GenerateData('Data/Avinash/avinash-walking-counting.csv');
    
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
    
    [m,~] = size(X3);
    trainSize = floor(0.7*m);
    X3Test = X3(trainSize+1:end,:);
    X3Train = X3(1:trainSize,:);
    clear X3;
    
    [m,~] = size(X4);
    trainSize = floor(0.7*m);
    X4Test = X4(trainSize+1:end,:);
    X4Train = X4(1:trainSize,:);
    clear X4;
    
    [m,~] = size(X5);
    trainSize = floor(0.7*m);
    X5Test = X5(trainSize+1:end,:);
    X5Train = X5(1:trainSize,:);
    clear X5;
    
    [m,~] = size(X6);
    trainSize = floor(0.7*m);
    X6Test = X6(trainSize+1:end,:);
    X6Train = X6(1:trainSize,:);
    clear X6;
    
    [m,~] = size(X7);
    trainSize = floor(0.7*m);
    X7Test = X7(trainSize+1:end,:);
    X7Train = X7(1:trainSize,:);
    clear X7;
    
    XTrain = [X1Train;X2Train;X3Train;X4Train;X5Train;X6Train;X7Train];
    
    [m1,~] = size(X1Train);
    [m2,~] = size([X1Train;X2Train]);
    [m3,~] = size([X1Train;X2Train;X3Train]);
    [m4,~] = size([X1Train;X2Train;X3Train;X4Train]);
    [m5,~] = size([X1Train;X2Train;X3Train;X4Train;X5Train]);
    [m6,~] = size([X1Train;X2Train;X3Train;X4Train;X5Train;X6Train]);
    [m7,~] = size([X1Train;X2Train;X3Train;X4Train;X5Train;X6Train;X7Train]);
    
    [m,~] = size(XTrain);
    yTrain = zeros(m,1);
    yTrain(1:m1) = 1;
    yTrain(m1+1:m2) = 2;
    yTrain(m2+1:m3) = 3;
    yTrain(m3+1:m4) = 4;
    yTrain(m4+1:m5) = 5;
    yTrain(m5+1:m6) = 6;
    yTrain(m6+1:m7) = 7;
    
    XTest = [X1Test;X2Test;X3Test;X4Test;X5Test;X6Test;X7Test];
    [m1,~] = size(X1Test);
    [m2,~] = size([X1Test;X2Test]);
    [m3,~] = size([X1Test;X2Test;X3Test]);
    [m4,~] = size([X1Test;X2Test;X3Test;X4Test]);
    [m5,~] = size([X1Test;X2Test;X3Test;X4Test;X5Test]);
    [m6,~] = size([X1Test;X2Test;X3Test;X4Test;X5Test;X6Test]);
    [m7,~] = size([X1Test;X2Test;X3Test;X4Test;X5Test;X6Test;X7Test]);
    
    [m,~] = size(XTest);
    yTest = zeros(m,1);
    yTest(1:m1) = 1;
    yTest(m1+1:m2) = 2;
    yTest(m2+1:m3) = 3;
    yTest(m3+1:m4) = 4;
    yTest(m4+1:m5) = 5;
    yTest(m5+1:m6) = 6;
    yTest(m6+1:m7) = 7;
end