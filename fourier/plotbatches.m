% this function takes in 2 params: a, b
% and plots the single-side amplitude spectrum of 
% batches begin to end on one single plot

function [] = plotbatches (batches)
    clf;
        [x,f] = freqAnalysis(batches);
        plot(f,x(:,1));
        title(sprintf('Single-Sided Amplitude Spectrum of X(t), batch %d to %d', a, b));
        xlabel('f (Hz)')
        ylabel('|P1(f)|')
        hold on
end