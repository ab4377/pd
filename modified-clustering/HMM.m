function [Seq1, Seq2] = HMM()
    [XTrain,yTrain,XTest,yTest] = GenerateTrainingData();
    [predictedLabels, trueLabels, posterior, ecocClf] = MultiClassClassification(XTrain,yTrain,XTest,yTest);
    [emissionMatrixGuess] = StandardizeConfusionMatrix(trueLabels,predictedLabels);
    transitionMatrixGuess = [0.95,0.01,0.01,0.01,0.01,0.01;
                             0.01,0.95,0.01,0.01,0.01,0.01;
                             0.01,0.01,0.95,0.01,0.01,0.01;
                             0.01,0.01,0.01,0.95,0.01,0.01;
                             0.01,0.01,0.01,0.01,0.95,0.01;
                             0.01,0.01,0.01,0.01,0.01,0.95];
                         
   XSeq1 = GenerateData('Data/Testing/Avinash-Sequence-1.csv');
   XSeq2 = GenerateData('Data/Testing/Avinash-Sequence-2.csv');
   XSeq3 = GenerateData('Data/Testing/Avinash-Sequence-3.csv');
   
   yseq1 = predict(ecocClf, XSeq1);
   yseq2 = predict(ecocClf, XSeq2);
   yseq3 = predict(ecocClf, XSeq3);
   
   [EmissionMatrix, TransitionMatrix] = hmmtrain(yseq3, transitionMatrixGuess, emissionMatrixGuess);
   TransitionMatrix(TransitionMatrix(:) == 0) = 0.05;
   for i=1:size(TransitionMatrix,1)
       TransitionMatrix(i,:) = TransitionMatrix(i,:)/sum(TransitionMatrix(i,:));
   end
   Seq1 = hmmviterbi(yseq1, TransitionMatrix, EmissionMatrix);
   Seq2 = hmmviterbi(yseq2, TransitionMatrix, EmissionMatrix);

end