function [X] = GenerateData(fileName)
    
    disp('Reading raw data');
    data = csvread(fileName,1,1);
    frequency = 100;
    numberOfSeconds = 10;
    [m,~] = size(data);
    i = 0;
    %the feature vector is dimension equal to 3*(size(ampx) + size(fx))
    rows = floor(m/(frequency*numberOfSeconds));
    d = 3*(frequency*numberOfSeconds/2 + 1);
    X = zeros(rows,d);
    while((i+1)*frequency*numberOfSeconds <= m)
        startIndex = i*frequency*numberOfSeconds + 1;
        endIndex = (i+1)*frequency*numberOfSeconds;
        [ampx,fx] = FreqAnalysis2(data(startIndex:endIndex,1));
        [ampy,fy] = FreqAnalysis2(data(startIndex:endIndex,2));
        [ampz,fz] = FreqAnalysis2(data(startIndex:endIndex,3));
        %break;
        i = i + 1;
        %size([ampx',fx',ampy',fy',ampz',fz'])
        %X(i,:) = [ampx',fx',ampy',fy',ampz',fz'];
        X(i,:) = [ampx',ampy',ampz'];
    end
end