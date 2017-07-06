function [G] = RBFKernel(X)
    [m,n] = size(X);
    G = zeros(m,m);
    for i=1:m
        for j=1:m
            G(i,j) = exp(-norm(X(i,:) - X(j,:),2)^2);
        end
        G(i,i) = 0;
    end
end