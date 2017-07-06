function [] = ScatterPlot(G,X,y,plot1,plot2)
    %this module to used for plotting the points in 3d space after
    %performing multi-dimensional scaling
    indexOfLastPositiveExample = find(y == -1,1) - 1;
    [m,n] = size(G);
    c1 = zeros( size( y(1:indexOfLastPositiveExample),1 ), 3);
    c2 = zeros( size( y(indexOfLastPositiveExample+1:end),1 ), 3);
    for i=1:size(c1,1)
        c1(i,:) = [255,0,0];
    end
    for i=1:size(c2,1)
        c2(i,:) = [0,255,0];
    end
    
    %c(c == 1) = 'r';
    %c(c == -1) = 'b';
        
    %if G is not symmetric and a upper triangular matrix
    if(istriu(G))
        G = G + G';
    end
    
    if(issymmetric(G) == 0)
        for i=1:m
            for j=i+1:n
                G(j,i) = G(i,j);
            end
            G(i,i) = 0;
        end
    end
    
    
    %create a scatter plot
    opts = statset('MaxIter',1000);
    Y = mdscale(G,3,'Options',opts);
    figure('Name','Multi-dimensional scaling');
    H(1) = scatter3(Y(1:indexOfLastPositiveExample,1),Y(1:indexOfLastPositiveExample,2),Y(1:indexOfLastPositiveExample,3),[],c1/255);
    hold on;
    H(2) = scatter3(Y(indexOfLastPositiveExample+1:end,1),Y(indexOfLastPositiveExample+1:end,2),Y(indexOfLastPositiveExample+1:end,3),[],c2/255);
    legend(H,{plot1,plot2});
    hold off;
   
%     cmap = ['r';'b'];
%     for i=1:2
%         H(i) = scatter3(nan,nan,nan,[],cmap(i));
%     end
%     legend(H,{'a','b','c'});
%     hold off;
end