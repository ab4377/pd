function [] = GaussianKernel(U,V,sigma)
    [u1,~] = size(U);
    [v1,~] = size(V);
    G = zeros(u1,v1);
    for i=1:u1
        for j=1:v1
            G(i,j) = exp( -norm(U(i,:) - V(j,:),2)/(2*sigma^2) );
        end
        G(i,i) = 0;
    end
end