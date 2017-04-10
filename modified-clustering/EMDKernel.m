function [G] = EMDKernel(U,V)
    %This function calculates the Gram matrix using EMD as the kernel
    %function
    %disp(size(U));
    %disp(size(V));
    %G = load('G.mat');
    [u1,~] = size(U);
    [v1,~] = size(V);
    disp(u1);
    disp(v1);
    G = zeros(u1,v1);
    width = 501;
    for i=1:u1
        for j=1:v1
            str = strcat('Calculating for data sample ',num2str(i),'and ',num2str(j));
            disp(str);
            %disp(i);
            %disp(j);
            %extract ith row from U and jth row from V
            ampx1 = U(i,1:width);
            fx1 = U(i,width+1:2*width);
            ampx2 = V(j,1:width);
            fx2 = V(j,width+1:2*width);
            e1 = EMD(ampx1',fx1',ampx2',fx2',0.05);
            %disp(e1);
            
            ampy1 = U(i,2*width+1:3*width);
            fy1 = U(i,3*width+1:4*width);
            ampy2 = V(j,2*width+1:3*width);
            fy2 = V(j,3*width+1:4*width);
            e2 = EMD(ampy1',fy1',ampy2',fy2',0.05);
            %disp(e2);
            
            ampz1 = U(i,4*width+1:5*width);
            fz1 = U(5*width+1:6*width);
            ampz2 = V(j,4*width+1:5*width);
            fz2 = V(j,5*width+1:6*width);
            e3 = EMD(ampz1',fz1',ampz2',fz2',0.05);
            %disp(e3);
            G(i,j) = (e1+e2+e3)/3;
        end
    end
    disp('completed');
end