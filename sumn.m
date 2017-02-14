function res = sumn(tagged, n)
   res = cell(size(tagged));
   for t = 1:length(tagged)
       cs = cumsum(vertcat(zeros(1,3),tagged{t}));
       res{t} = (cs((n+1):length(cs),:)-cs(1  :(length(cs)-n),:))/n;
   end
end
   
  