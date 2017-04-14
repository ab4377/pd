function [G] = EMDMatrix()
    tic;
    [XTrain,yTrain,XTest,yTest] = GenerateTrainingData();
    G = EMDKernel(XTrain,XTrain);
    toc;
end