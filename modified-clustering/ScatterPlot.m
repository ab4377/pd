function [] = ScatterPlot()
    %load('G-sit-to-stand & standing.mat');
    load('CVX-sit-to-stand-&-standing.mat')
    [m,n] = size(CVX);
    %create a scatter plot
    c = zeros(m,1);
    c(1:42,:) = 'r';
    c(43:84,1) = 'b';
    
%     load('G-upstairs & standing.mat');
%     [m,n] = size(G);
%     c = zeros(m,1);
%     c(1:28,:) = 'r';
%     c(29:70,:) = 'b';
    
    %Note that G is not symmetric because of precision error of
    %calculation
    for i=1:m
        for j=i+1:n
            CVX(j,i) = CVX(i,j);
        end
        CVX(i,i) = 0;
    end
    %create a scatter plot
    %c = zeros(m,1);
    %c(1:m/2,:) = 'r';
    %c(m/2+1:m,1) = 'b';
    %Y = mdscale(G,3);
    %scatter3(Y(:,1),Y(:,2),Y(:,3),[],c);
    
    %     c = zeros(m,1);
    %     c(1:28,:) = 'r';
    %     c(29:70,:) = 'b';
    Y = mdscale(CVX,3);
    scatter3(Y(:,1),Y(:,2),Y(:,3),[],c);
    %legend('show');
end