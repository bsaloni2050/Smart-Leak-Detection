[Y,M,D,H,~,~] = datevec(Days_PGLK);
year=2015;
month=3;
x=length(H);

day_wo = zeros(1,30);
for i = 1:30
day_wo(i)=calc_MNF(Y,year,M,month,D,i,H,MNFScaleDown);
end
%disp(day)
 in=1;
 if day_wo(i)~=5000
    for i = 1:30
        day(in)=day_wo(i);
        in=in+1;
    end
end

% sum=0;g=0;
% for i =1:length(day)
%     if day(i)~=0
%     sum= sum+day(i);
%     g=g+1;
%     end
% end
% 
% MNF_avg= sum/g;
% disp(MNF_avg)
MNF_avg=mean(day);
disp(MNF_avg)