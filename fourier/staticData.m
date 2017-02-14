n=length(halfActs);
%for i=1:2
i=1;
    a=cell2mat(halfActs(i));
    for j=1:length(a(:,1))
    mx=norm(a(j,:));
    an(j,1)=a(j,1)/mx;
    an(j,2)=a(j,2)/mx;
    an(j,3)=a(j,3)/mx;
    end;
    c=mean(a);
    cv=std(a);
    m(i,1)=c(1,1);
    m(i,2)=c(1,2);
    m(i,3)=c(1,3);
    vr(i,1)=cv(1,1);
    vr(i,2)=cv(1,2);
    vr(i,3)=cv(1,3);
    vrn(i)=norm(cv);
    %scatter3(a(:,1)-c(1,1),a(:,2)-c(1,2),a(:,3)-c(1,3),'o')
    plot(a)
    hold on 
    
    
    a=cell2mat(restActs(i));
    for j=1:length(a(:,1))
    mx=norm(a(j,:));
    an(j,1)=a(j,1)/mx;
    an(j,2)=a(j,2)/mx;
    an(j,3)=a(j,3)/mx;
    end;
    c=mean(a);
    cv=std(a);
    m(i,1)=c(1,1);
    m(i,2)=c(1,2);
    m(i,3)=c(1,3);
    vr(i,1)=cv(1,1);
    vr(i,2)=cv(1,2);
    vr(i,3)=cv(1,3);
    vrn(i)=norm(cv);
    %scatter3(a(:,1)-c(1,1),a(:,2)-c(1,2),a(:,3)-c(1,3),'o')
    plot(a)
    hold on 
%end;

hold on
% text(m(:,1),m(:,2),m(:,3),halfActNames,'Color','blue')
% remainingActHolder=filteredRestActs;
% n=length(remainingActHolder);
% for i=1:n
%     at=cell2mat(remainingActHolder(i));
%     for j=1:length(at(:,1))
%     mxt=norm(at(j,:));
%     ant(j,1)=at(j,1)/mxt;
%     ant(j,2)=at(j,2)/mxt;
%     ant(j,3)=at(j,3)/mxt;
%     end;
%     ct=mean(at);
%     cvt=std(at);
%     mt(i,1)=ct(1,1);
%     mt(i,2)=ct(1,2);
%     mt(i,3)=ct(1,3);
%     vrt(i,1)=cvt(1,1);
%     vrt(i,2)=cvt(1,2);
%     vrt(i,3)=cvt(1,3);
%     vrnt(i)=norm(cvt);
% end;
% hold on
% scatter3(mt(:,1),mt(:,2),mt(:,3),vrnt.*1000, rand(20,3),'diamond')
% hold on
% text(mt(:,1),mt(:,2),mt(:,3),restActNames,'Color','green')
% remainingActHolder=restActs;
% n=length(remainingActHolder);
% for i=1:n
%     at=cell2mat(remainingActHolder(i));
%     for j=1:length(at(:,1))
%     mxt=norm(at(j,:));
%     ant(j,1)=at(j,1)/mxt;
%     ant(j,2)=at(j,2)/mxt;
%     ant(j,3)=at(j,3)/mxt;
%     end;
%     ct=mean(at);
%     cvt=std(at);
%     mt(i,1)=ct(1,1);
%     mt(i,2)=ct(1,2);
%     mt(i,3)=ct(1,3);
%     vrt(i,1)=cvt(1,1);
%     vrt(i,2)=cvt(1,2);
%     vrt(i,3)=cvt(1,3);
%     vrnt(i)=norm(cvt);
% end;
% hold on
% scatter3(mt(:,1),mt(:,2),mt(:,3),vrnt.*1000, rand(20,3),'diamond')
% hold on
% text(mt(:,1),mt(:,2),mt(:,3),restActNames,'Color','red')
%%%  stdRBFLearner = templateSVM('Standardize',1,'KernelFunction','rbf');