function [label,min] = ClassifyTestDataPoint(trainingData, testDataPoint, noiseCancellationParameter)
    min = Inf;
    label = -1;
    for i=1:size(trainingData,1)
        emd = 0;
        str = strcat('Activity number ',num2str(i));
        disp(str);
        for j=1:size(trainingData{i},2)
            %x-axis data
            x1 = trainingData{i}{j}(:,1);
            [ampx1,fx1] = freqAnalysis(x1);
            [ampx2,fx2] = freqAnalysis(testDataPoint(:,1));
            x = EMD(ampx1,fx1,ampx2,fx2,noiseCancellationParameter);
            
            %y-axis data
            y1 = trainingData{i}{j}(:,2);
            [ampy1,fy1] = freqAnalysis(y1);
            [ampy2,fy2] = freqAnalysis(testDataPoint(:,2));
            y = EMD(ampy1,fy1,ampy2,fy2,noiseCancellationParameter);
            
            %z-axis data
            z1 = trainingData{i}{j}(:,3);
            [ampz1,fz1] = freqAnalysis(z1);
            [ampz2,fz2] = freqAnalysis(testDataPoint(:,3));
            z = EMD(ampz1,fz1,ampz2,fz2,noiseCancellationParameter);
            emd = emd + (x+y+z)/3;
        end
        emd = emd/size(trainingData{i},2);
        if(emd < min)
            min = emd;
            label = i;
        end
    end
end