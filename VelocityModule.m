function [] = VelocityModule() 
    accelerationValues = csvread('RawData2.csv',1,3);
    xAxis = 1:size(accelerationValues(:,1));
    XVelocityValues = GetVelocityValues(accelerationValues(:,1));
    YVelocityValues = GetVelocityValues(accelerationValues(:,2));
    ZVelocityValues = GetVelocityValues(accelerationValues(:,3));
    figure;
    subplot(3,1,1);
    plot(xAxis,accelerationValues(:,1),xAxis,XVelocityValues);
    title('Acceleration and Velocity in X-direction');
    
    subplot(3,1,2);
    plot(xAxis,accelerationValues(:,2),xAxis,YVelocityValues);
    title('Acceleration and Velocity in Y-direction');
    
    subplot(3,1,3);
    plot(xAxis,accelerationValues(:,3),xAxis,ZVelocityValues);
    title('Acceleration and Velocity in Z-direction');
end