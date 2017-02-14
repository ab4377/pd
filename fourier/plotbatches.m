% this function takes in 2 params: a, b
% and plots the single-side amplitude spectrum of 
% batches begin to end on one single plot

function [] = plotbatches (a, b)
    ReadData;
    clf;
    for t=a:b
        [x,f] = freqAnalysis(batched{t});
        plot(f,x(:,1));
        title(sprintf('Single-Sided Amplitude Spectrum of X(t), batch %d to %d', a, b));
        xlabel('f (Hz)')
        ylabel('|P1(f)|')
        hold on
    end
end