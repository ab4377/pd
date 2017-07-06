function [] = CompareLinearPrograms()
    %Example p = 5000x + 3000y
    D = [5000,3000]';
    A = [-1,0;0,-1;-1,-1;-2,-1];
    b = [0;0;-8;-10];
    [x,fval] = linprog(D,A,b);
    disp(fval);
    disp(x);
    
    disp('====');
    
    cvx_begin quiet
        variable x(2);
        minimize(D'*x);
        subject to
            A*x <= b;
    cvx_end
    disp(D'*x);
    disp(x)
end