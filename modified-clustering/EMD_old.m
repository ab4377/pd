function [] = EMD()
    tagged = ReadData();
    
    %size(tagged);
    %Get the distance matrix
    d = zeros(5,5);
    for i=1:5
        for j=1:5
            d(i,j) = abs(i-j);
        end
    end
    
    m = 5;
    n = 5;
    standingWeights = zeros(m,1);
    walkingWeights = zeros(n,1);
   
    [amp,f] = freqAnalysis(tagged{1}(:,1));
    %disp(f);
    [ind,~] = find(f > 0 & f <= 5);
    standingZeroToFive = amp(ind);
    standingWeights(1) = size(standingZeroToFive,1);
    [ind,~] = find(f > 5 & f <= 10);
    standingFiveToTen = amp(ind);
    standingWeights(2) = size(standingFiveToTen,1);
    [ind,~] = find(f > 10 & f <= 15);
    standingTenToFifteen = amp(ind);
    standingWeights(3) = size(standingTenToFifteen,1);
    [ind,~] = find(f > 15 & f <= 20);
    standingFifteenToTwenty = amp(ind);
    standingWeights(4) = size(standingFifteenToTwenty,1);
    [ind,~] = find(f > 20 & f <= 25);
    standingTwentyToTwentyFive = amp(ind);
    standingWeights(5) = size(standingTwentyToTwentyFive,1);
    
    [amp,f] = freqAnalysis(tagged{2}(:,1));
    disp(f);
    [ind,~] = find(f > 0 & f <= 5);
    walkingZeroToFive = amp(ind);
    walkingWeights(1) = size(walkingZeroToFive,1);
    [ind,~] = find(f > 5 & f <= 10);
    walkingFiveToTen = amp(ind);
    walkingWeights(2) = size(walkingFiveToTen,1);
    [ind,~] = find(f > 10 & f <= 15);
    walkingTenToFifteen = amp(ind);
    walkingWeights(3) = size(walkingTenToFifteen,1);
    [ind,~] = find(f > 15 & f <= 20);
    walkingFifteenToTwenty = amp(ind);
    walkingWeights(4) = size(walkingFifteenToTwenty,1);
    [ind,~] = find(f > 20 & f <= 25);
    walkingTwentyToTwentyFive = amp(ind);
    walkingWeights(5) = size(walkingTwentyToTwentyFive,1);
    
    % inequality constraints
    A1 = zeros(m, m * n);
    A2 = zeros(m, m * n);
    for i = 1:m
        for j = 1:n
            k = j + (i - 1) * n;
            A1(i, k) = 1;
            A2(j, k) = 1;
        end
    end
    A = [A1; A2];
    weights = [standingWeights;walkingWeights];
%     disp('size of A');
%     disp(size(A));
%     disp('size of weights');
%     disp(size(standingWeights));
%     disp(size(walkingWeights));
%     disp(size(weights));
    Aeq = ones(m+n,m*n);
    beq = ones(m+n,1)*min(sum(standingWeights),sum(walkingWeights));
    
    % lower bound
    lb = zeros(1, m * n);
    [x, fval] = linprog(d, A, weights, Aeq, beq, lb);
    %disp(fval);
    %disp(x);
    fval = fval / sum(x);
    %disp(sum(x));
    %disp(fval);
    %disp(size(standingTwentyToTwentyFive));
end