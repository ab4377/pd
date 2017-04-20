function [] = SVM()
    %clf = fitcsvm(XTrain,yTrain,'KernelFunction','rbf','Standardize',true);
    
    [XTrain,yTrain,XTest,yTest] = GenerateTrainingData();
    clf = fitcsvm(XTrain,yTrain,'KernelFunction','rbf','Standardize',false);
    %clf = fitcsvm(XTrain,yTrain,'KernelFunction','EMDKernel','Standardize',false);
    [labels,scores] = predict(clf,XTrain);
    correct = sum(yTrain == labels);
    disp('training accuracy');
    disp(correct/size(yTrain,1));
    [labels,scores] = predict(clf,XTest);
    correct = sum(yTest == labels);
    disp('testing accuracy');
    disp(correct/size(yTest,1));
    
    %     [XTrain,yTrain,XTest,yTest] = GenerateTrainingData();
    %     clf = fitcsvm(XTrain,yTrain,'KernelFunction','rbf','Standardize','false');
    %     [labels,scores] = predict(cl);
end