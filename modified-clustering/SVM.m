function [] = SVM(XTrain,yTrain,XTest,yTest)
    %clf = fitcsvm(XTrain,yTrain,'KernelFunction','rbf','Standardize',true);
    clf = fitcsvm(XTrain,yTrain,'KernelFunction','EMDKernel','Standardize',false);
    [labels,scores] = predict(clf,XTrain);
    correct = sum(yTrain == labels);
    disp('training error');
    disp(correct);
    [labels,scores] = predict(clf,XTest);
    correct = sum(yTest == labels);
    disp('testing error');
    disp(correct);
end