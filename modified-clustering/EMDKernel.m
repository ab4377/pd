function [G] = EMDKernel(U,V)
    %This function calculates the Gram matrix using EMD as the kernel
    %function
    %G = load('G.mat');
    [u1,~] = size(U);
    [v1,~] = size(V);
    %disp(u1);
    %disp(v1);
    G = zeros(u1,v1);
    [fs,numberOfSeconds] = ParseXMLFile();
    width = floor(fs*numberOfSeconds/2) + 1;
    L = fs*numberOfSeconds;
    f = fs*(0:L/2)/L; % generate a vector of frequency
    f = f.'; %transposing the frequency array
    disp('called');
    for i=1:u1
        for j=i+1:v1
            str = strcat('Calculating for data sample ',num2str(i),'and ',num2str(j));
            disp(str);
            %disp(i);
            %disp(j);
            %extract ith row from U and jth row from V
            ampx1 = U(i,1:width);
            ampx2 = V(j,1:width);
            e1 = EMD(ampx1',f,ampx2',f,0.05);
            %disp(e1);
            
            ampy1 = U(i,width+1:2*width);
            ampy2 = V(j,width+1:2*width);
            e2 = EMD(ampy1',f,ampy2',f,0.05);
            %disp(e2);
            
            ampz1 = U(i,2*width+1:3*width);
            ampz2 = V(j,2*width+1:3*width);
            e3 = EMD(ampz1',f,ampz2',f,0.05);
            %disp(e3);
            G(i,j) = (e1+e2+e3)/3;
            %G(i,j) = 1/G(i,j);
        end
        G(i,i) = 0;
    end
    %disp('completed');
end