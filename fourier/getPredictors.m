start=1;
b=cell2mat(halfActs(1));
for i=2:length(halfActs)
    a=cell2mat(halfActs(i));
    b=vertcat(b,a);
end;
b=b(:,1:3);
ntags = length(halfActs);
y=0;
for t=1:ntags
    start=(tags(t,1)+1);
    ending=tags(t,2);
  y( start:ending)=ones((ending-start)+1,1)*t;
end
resCount=0;
for j=1:length(y(1,:))
    if (y(j)~=0)
        resCount=resCount+1;
        res(resCount)=y(j);
    end;
end;