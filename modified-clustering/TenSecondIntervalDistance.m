function [fx1,fx2] = TenSecondIntervalDistance(data, noiseCancellationParameter)
    %This function divides the data into 10s interval chucks
    %and calculates EMD between two consecutive chunks
    str = strcat('Computing EMD for data of size: ',num2str(size(data,1)));
    disp(str);
    i = 0;
    frequency = 50;
    numberOfSeconds = 10;
    sequentialData = {};
    while(frequency*numberOfSeconds*i <= size(data,1))
        if(frequency*numberOfSeconds*(i+1) > size(data,1))
            sequentialData{i+1} = data(frequency*numberOfSeconds*i : end,:);
        else
            sequentialData{i+1} = data(frequency*numberOfSeconds*i + 1:frequency*numberOfSeconds*(i+1),:);
        end
        i = i + 1;
    end
    [ampx1,fx1] = freqAnalysis(sequentialData{1}(1:end,1));
    [ampx2,fx2] = freqAnalysis(sequentialData{2}(1:end,1));
    
    %     tenSecondIntervalDistance = zeros(size(sequentialData,2)-1,1);
    %     for i=1:size(sequentialData,2)-1
    %         str = strcat('Computing EMD for next two samples... ',num2str(i),' and ',num2str(i+1));
    %         disp(str);
    %
    %         [ampx1,fx1] = freqAnalysis(sequentialData{i}(1:end,1));
    %         [ampx2,fx2] = freqAnalysis(sequentialData{i+1}(1:end,1));
    %         x = EMD(ampx1,fx1,ampx2,fx2,noiseCancellationParameter);
    %         if(i == 120)
    %             y = Inf;
    %             z = Inf;
    %         else
    %            [ampy1,fy1] = freqAnalysis(sequentialData{i}(1:end,2));
    %            [ampy2,fy2] = freqAnalysis(sequentialData{i+1}(1:end,2));
    %            y = EMD(ampy1,fy1,ampy2,fy2,noiseCancellationParameter);
    %
    %            [ampz1,fz1] = freqAnalysis(sequentialData{i}(1:end,3));
    %            [ampz2,fz2] = freqAnalysis(sequentialData{i+1}(1:end,3));
    %            z = EMD(ampz1,fz1,ampz2,fz2,noiseCancellationParameter);
    %         end
    %         tenSecondIntervalDistance(i) = (x+y+z)/3;
    %         %disp('Computed');
    %     end
    %     disp('Computing for y...');
    %     y = EMD(ampy1,fy1,ampy2,fy2,noiseCancellationParameter);
    %     disp('Computed for y');
    %
    %     tenSecondIntervalDistance(i) = (x+y+z)/3;
    %     disp('Computed');
end

