% plots the single-side amplitude spectrum of 
% batches begin to end on one single plot

function [] = plotbatches (batches)
    clf;
        [x,f] = freqAnalysis(batches);
        plot(f,x(:,1));
end