for i=1:length(b(:,1))
    m=norm(b(i,:));
    bnormCC(i,1)=b(i,1)/m;
    bnormCC(i,2)=b(i,2)/m;
    bnormCC(i,3)=b(i,3)/m;
end;