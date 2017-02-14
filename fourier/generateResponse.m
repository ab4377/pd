n = length(restActs);
testy=[1:3,6:22];
init=1;
correctresp=0;
for t=1:n
    start=(tags(t+22,1)+1);
    ending=tags(t+22,2);
    a=ones((ending-start)+1,1)*testy(t);
    correctresp=vertcat(correctresp,a);
end
correctresp=correctresp(2:end);
testinp=cell2mat(restActs(1));
for k=2:n
    lm=cell2mat(restActs(k));
    testinp=vertcat(testinp,lm);
end;
testinp=testinp(:,1:3);
