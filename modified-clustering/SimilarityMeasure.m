function [ similarityMatrix ] = SimilarityMeasure(activities)
   %SimilarityMeasure
   %Inputs are the activities which is a cell array
   [~,numberOfActivities] = size(activities);
   similarityMatrix = zeros(numberOfActivities,numberOfActivities);
   for i=1:numberOfActivities
       for j=i:numberOfActivities
           [ampx1,fx1] = freqAnalysis(activities{i}(1:end,1));
           [ampx2,fx2] = freqAnalysis(activities{j}(1:end,1));
           x = EMD(ampx1,fx1,ampx2,fx2,0.05);
           
           [ampy1,fy1] = freqAnalysis(activities{i}(1:end,2));
           [ampy2,fy2] = freqAnalysis(activities{j}(1:end,2));
           y = EMD(ampy1,fy1,ampy2,fy2,0.05);
           
           [ampz1,fz1] = freqAnalysis(activities{i}(1:end,3));
           [ampz2,fz2] = freqAnalysis(activities{j}(1:end,3));
           z = EMD(ampz1,fz1,ampz2,fz2,0.05);
           similarityMatrix(i,j) = (x + y + z)/3;
       end
   end
   
   for i=1:numberOfActivities
       for j=1:(i-1)
           similarityMatrix(i,j) = similarityMatrix(j,i);
       end
   end
end

