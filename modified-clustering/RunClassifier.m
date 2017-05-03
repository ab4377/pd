function [] = RunClassifier()
    [XTrain,yTrain,XTest,yTest] = GenerateTrainingData();
    MultiClassClassification(XTrain,yTrain,XTest,yTest);
end