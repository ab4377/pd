function [G] = EMDMatrix()
    tic;
    [XTrain,yTrain,XTest,yTest] = GenerateTrainingDataForBinaryClassifier();
    G = EMDKernel(XTrain,XTrain);
    toc;
end