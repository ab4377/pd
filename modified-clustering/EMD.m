function [ emd ] = EMD(amp1, f1, amp2, f2)
    %EMD for two signals based on their frequency spectrum 
    %Inputs are amplitudes and frequencies
    
    %Remove the additive noise in the signal and add it to the array W 
    %preallocate the array X
    W1 = zeros(size(amp1)); %store the amplitudes as weights
    X = zeros(size(f1)); %store the freq. as the data points which need to be moved
    count = 1;
    for j=1:length(amp1)
       if(amp1(j) <= 0.05)
           continue;
       else
           W1(count) = amp1(j) - 0.05;
           X(count) = f1(j);
           count = count + 1;
       end
    end
    %Now truncate the array to required size
    index = find(W1 == 0,1,'first');
    W1 = W1(1:index);
    X = X(1:index);
   
    W2 = zeros(size(amp2));
    Y = zeros(size(f2));
    count = 1;
    for j=1:length(amp2)
       if(amp2(j) <= 0.05)
           continue;
       else
           W2(count) = amp2(j) - 0.05;
           Y(count) = f2(j);
           count = count + 1;
       end
    end
    %Now truncate the array to required size
    index = find(W2 == 0,1,'first');
    W2 = W2(1:index);
    Y = Y(1:index);
    
    %Calculate the distance matrix
    %We will be using the euclidean distance as the ground distance
    %Since, what we have is 1-dimensional, we get simply |X(i) - Y(j)|
    [m,~] = size(X);
    [n,~] = size(Y);
    D = zeros(m,n);
    for i=1:m
        for j=1:n
            D(i,j) = abs(X(i) - Y(j));
        end
    end
    D = D';
    D = D(:);
    
    % inequality constraints
    A1 = zeros(m, m * n);
    A2 = zeros(n, m * n);
    for i = 1:m
        for j = 1:n
            k = j + (i - 1) * n;
            A1(i, k) = 1;
            A2(j, k) = 1;
        end
    end
    A = [A1; A2];
    b = [W1; W2];
    
    %equality constraints
    Aeq = ones(m + n, m * n);
    beq = ones(m + n, 1) * min(sum(W1), sum(W2));
    
    %lower bound
    lb = zeros(1, m * n);
    
    %linear programming
    [x, fval] = linprog(D, A, b, Aeq, beq, lb);
    %disp(fval);
    emd = fval / sum(x);
end

