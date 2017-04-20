function [] = GetSymmetricMatrix(C)
    [m,n] = size(C);
    for i=1:m
        for j=1:n
            if(isnan(C(i,j)) == 1)
                disp('nan');
                break;
            end
            if(C(i,j) == Inf)
                disp('Inf');
                break;
            end
        end
    end
end