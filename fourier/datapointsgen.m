Acts=halfActs;
n=length(halfActs);
ni=250;
dps={};
count=0;
for i=1:n
    a=cell2mat(halfActs(i));
    na=length(a);
    k=na/ni;
    for j=1:k
        to=250*j;
        from=to-249;
        count=count+1;
        dps{count}=a(from:to,1:3);
    end
end