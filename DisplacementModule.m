function [] = DisplacementModule() 
    accelerationValues = csvread('RawData2.csv',1,3);
    xAxis = 1:size(accelerationValues(:,1));
    
    XVelocityValues = GetAreaUnderCurve(accelerationValues(:,1));
    YVelocityValues = GetAreaUnderCurve(accelerationValues(:,2));
    ZVelocityValues = GetAreaUnderCurve(accelerationValues(:,3));

    XDisplacementValues = GetAreaUnderCurve(XVelocityValues);
    YDisplacementValues = GetAreaUnderCurve(YVelocityValues);
    ZDisplacementValues = GetAreaUnderCurve(ZVelocityValues);
    
    data = [accelerationValues(:,1:3),XVelocityValues,YVelocityValues,ZVelocityValues,XDisplacementValues,YDisplacementValues,ZDisplacementValues];
    header{1} = 'XAccleration';
    header{2} = 'YAcceleration';
    header{3} = 'ZAcceleration';
    header{4} = 'XVelocity';
    header{5} = 'YVelocity';
    header{6} = 'ZVelocity';
    header{7} = 'XDisplacement';
    header{8} = 'YDisplacement';
    header{9} = 'ZDisplacement';
    [~,hcol] = size(header);
    outid = fopen('output.txt', 'w+');
    % write header
    for idx = 1:hcol
        fprintf (outid, '%s', header{idx});
        if idx ~= hcol
            fprintf (outid, ',');
        else
            fprintf (outid, '\n' );
        end
    end
    % close file
    fclose(outid);

    % write data
    dlmwrite ('output.txt', data, '-append' );
    
    subplot(4,1,1);
    plot(xAxis,accelerationValues(:,1),xAxis,XVelocityValues,xAxis,XDisplacementValues);
    title('Acceleration, Velocity and Displacement in X-direction');
    legend('Acceleration','Velocity','Displacement');
    
    subplot(4,1,2);
    plot(xAxis,accelerationValues(:,2),xAxis,YVelocityValues,xAxis,YDisplacementValues);
    title('Acceleration, Velocity and Displacement in Y-direction');
    legend('Acceleration','Velocity','Displacement');
    
    subplot(4,1,3);
    plot(xAxis,accelerationValues(:,3),xAxis,ZVelocityValues,xAxis,ZDisplacementValues);
    title('Acceleration, Velocity and Displacement in Z-direction');
    legend('Acceleration','Velocity','Displacement');
    
    Fs = 50;            % Sampling frequency
    T = 1/Fs;             % Sampling period
    L = 270000;             % Length of signal
    
    Y = fft(XVelocityValues);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = Fs*(0:(L/2))/L;
    subplot(4,1,4);
    plot(f,P1)
    title('Single-Sided Amplitude Spectrum of S(t) (X-Velocity)')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')
end