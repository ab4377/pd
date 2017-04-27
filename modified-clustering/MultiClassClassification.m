function [] = MultiClassClassification(XTrain,yTrain,XTest,yTest)
    %MULTICLASSCLASSIFICATION Summary of this function goes here
    
    %t = templateSVM('Standardize',0,'KernelFunction','gaussian');
    t = templateSVM('Standardize',0,'KernelFunction','EMDKernel');
    ecocClf = fitcecoc(XTrain,yTrain,'Learners',t);
    [labels,scores] = predict(ecocClf,XTrain);
    
    correct = sum(yTrain == labels);
    disp('training accuracy');
    disp(correct/size(yTrain,1));
    
    [labels,scores] = predict(ecocClf,XTest);
    correct = sum(yTest == labels);
    disp('testing accuracy');
    disp(correct/size(yTest,1));
end

