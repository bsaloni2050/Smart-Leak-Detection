%cal function to calculate MNF and threshold
MNF_for_Each_Day

% initializing the values 
l= length(day);
days=zeros(1,l);
non_anomaly=zeros(1,l);
anomaly=zeros(1,l);
slopclean=zeros(1,l);
combine=zeros(1,l);
MNF_Normalized=zeros(1,l);


for i = 1:l
  days(i)=i;
end

% normalise the data using average
for i= 1:l
    MNF_Normalized(i)=day(i)/MNF_avg;
end

% calculate STD,upper and lower bound-Round 1
upperb=1+std(MNF_Normalized);
%lowerb=1-std(MNF_Normalized);


% filter using first standard deviation - Round 1
for i=1:l
    if(MNF_Normalized(i)>=upperb) % || MNF_Normalized(i)<=lowerb)
       anomaly(i)= MNF_Normalized(i);
    else
         non_anomaly(i)= MNF_Normalized(i);
    end
end
 
% calculate STD,upper and lower bound-Round 2
upperb=1+std(non_anomaly);
lowerb=1-std(non_anomaly);


% filter using first standard deviation - Round 2
for i=1:l
    if(non_anomaly(i)>=upperb ) %|| non_anomaly(i)<=lowerb)
       anomaly(i)= MNF_Normalized(i);
    end
end

%combining MNF_Normalised and Anomaly data
 for i = 1:l
   if non_anomaly(i)==0
       combine(i)=anomaly(i);
   else
       combine(i)=non_anomaly(i);
   end
 end
 
%  for i = 1:l
%     if anomaly(i)<=upperb
%         non_anomaly(i)=anomaly(i);
%     end
%  end
 
 
%plot
subplot(2,2,1) 
plot(days(non_anomaly~=0),non_anomaly(non_anomaly~=0),'*');
hold on
plot(days(anomaly~=0),anomaly(anomaly~=0),'*');
%plot(days,combine,'*');
hold on
hline = refline([0 1.15]);
hline.Color = 'b';
hold on
hline = refline([0 1.4]);
hline.Color = 'y';
hold on
hline = refline([0 1.7]);
hline.Color = 'r';
hold off    
xlabel('Time Series (Days)') 
ylabel('F Avg%')
legend('F','FAnomaly','15%','40%','70%','Location','northeast')
title('DeltaF v/s Days ')

Plot_graphs_progressive_leaks
% GUI_Progressive_Leak_LI
% GUI_Progressive_Leak_RI
% GUI_Progressive_Leak_SI
