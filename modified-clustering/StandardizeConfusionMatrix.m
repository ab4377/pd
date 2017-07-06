function [standardizedMat] = StandardizeConfusionMatrix(true, predicted) 
    % get the unstandardized matrix
    confmat = confusionmat(true, predicted);
    [n, ~] = size(confmat);
    
    % standardize the matrix according to each row
    for i=1:n
        rowTotal = sum(confmat(i,:));
        for j=1:n
            confmat(i,j) = confmat(i,j)/rowTotal;
        end
    end
   
    standardizedMat = confmat;
end