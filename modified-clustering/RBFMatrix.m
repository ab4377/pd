function [G] = RBFMatrix()
    tic;
    [XTrain,yTrain,XTest,yTest] = GenerateTrainingDataForBinaryClassifier();
    G = RBFKernel(XTrain);
    toc;
end