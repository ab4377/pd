function [X] = GenerateData(fileName)
    
    disp('Reading raw data');
    data = csvread(fileName,1,1);
    %frequency = 99;
    %numberOfSeconds = 10;
    [frequency,numberOfSeconds] = ParseXMLFile();
    [m,~] = size(data);
    i = 0;
    %the feature vector is dimension equal to 3*(size(ampx) + size(fx))
    rows = floor(m/(frequency*numberOfSeconds));
    d = 3*(frequency*numberOfSeconds/2 + 1);
    X = zeros(rows,d);
    while((i+1)*frequency*numberOfSeconds <= m)
        startIndex = i*frequency*numberOfSeconds + 1;
        endIndex = (i+1)*frequency*numberOfSeconds;
        [ampx,~] = FreqAnalysis2(data(startIndex:endIndex,1));
        [ampy,~] = FreqAnalysis2(data(startIndex:endIndex,2));
        [ampz,~] = FreqAnalysis2(data(startIndex:endIndex,3));
        i = i + 1;
        X(i,:) = [ampx',ampy',ampz'];
    end
end