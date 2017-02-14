c=1;

for i=1:length(actresp)
    if (actresp(i)==correctresp(i))
        corr(c)=actresp(i);
        c=c+1;
    end;
end;