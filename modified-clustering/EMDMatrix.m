function [G] = EMDMatrix(X)
    %this function can be used to find the gram matrix using EMD distance
    %measure
    tic;
    %[XTrain,yTrain,XTest,yTest] = GenerateTrainingDataForBinaryClassifier();
    G = EMDKernel(X,X);
    toc;
end