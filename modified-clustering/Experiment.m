function [ output_args ] = Experiment( input_args )
%EXPERIMENT Summary of this function goes here
%   Detailed explanation goes here
    dataForWalking = csvread('Walking.csv',1,0);
    size(dataForWalking)
    dataForJumping = csvread('Jumping.csv',1,0);
    size(dataForJumping)
    %EMD(dataForWalking(:,2),dataForWalking(:,1),dataForJumping(:,2),dataForJumping(:,1))
end

