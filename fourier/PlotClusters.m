function fg = PlotClusters(tagged)
    fg = figure;
    hold on;
    colors='cmykrgb';
    for t=1:length(tagged)
        sz=ceil(t/7);
        col=colors(t-(sz-1)*7);
         scatter3(tagged{t}(:,1), tagged{t}(:,2), tagged{t}(:,3),sz,col)
    end
end            