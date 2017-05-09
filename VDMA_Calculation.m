
l= length(ACS1);
combine_AC=zeros(1,l);
combine_ADV=zeros(1,l);
hours=zeros(1,l);
for i = 1:l
    hours(i)=i;
end

for i=1:24
    combine_AC(i)=ACS1(i)+ACS2(i);
    combine_ADV(i)=ADVS1(i)+ADVS2(i);
end


subplot(2,2,1)  
t1=plot(hours,ACS1,'-');
t1.Color='r';
set(t1,'LineWidth',1.2);
hold on
t2=plot(hours,ADVS1,'-');
t2.Color='b';
set(t2,'LineWidth',1.2);
hold on
hline = refline([0 10]);
hline.Color = 'k';
hold on
hline = refline([0 20]);
hline.Color = 'k';
hold on
hline = refline([0 30]);
hline.Color = 'k';
hold on
hline = refline([0 40]);
hline.Color = 'k';
hold on
hline = refline([0 50]);
hline.Color = 'k';
hold on
hline = refline([0 60]);
hline.Color = 'k';
hold on
hline = refline([0 70]);
hline.Color = 'k';
hold off    
xlabel('Time Series (Hours)') 
ylabel('CMH')
legend('Consumed','Distributed','Location','northwest')
title('Sector 1 - Consumed v/s Distributed ')

subplot(2,2,2)  
t1=plot(hours,ACS2,'-');
t1.Color='r';
set(t1,'LineWidth',1.2);
hold on
t2=plot(hours,ADVS2,'-');
t2.Color='b';
hold on
hline = refline([0 10]);
hline.Color = 'k';
hold on
hline = refline([0 20]);
hline.Color = 'k';
hold on
hline = refline([0 30]);
hline.Color = 'k';
hold on
hline = refline([0 40]);
hline.Color = 'k';
hold on
hline = refline([0 50]);
hline.Color = 'k';
hold on
hline = refline([0 60]);
hline.Color = 'k';
hold on
hline = refline([0 70]);
hline.Color = 'k';
set(t2,'LineWidth',1.2);
hold off    
xlabel('Time Series (Hours)') 
ylabel('CMH')
legend('Consumed','Distributed','Location','northwest')
title('Sector 2 - Consumed v/s Distributed ')

subplot(2,2,3)  
t1=plot(hours,combine_AC,'-');
t1.Color='r';
set(t1,'LineWidth',1.2);
hold on
t2=plot(hours,combine_ADV,'-');
t2.Color='b';
set(t2,'LineWidth',1.2);
hold on
hline = refline([0 20]);
hline.Color = 'k';
hold on
hline = refline([0 40]);
hline.Color = 'k';
hold on
hline = refline([0 60]);
hline.Color = 'k';
hold on
hline = refline([0 80]);
hline.Color = 'k';
hold on
hline = refline([0 100]);
hline.Color = 'k';
hold on
hline = refline([0 120]);
hline.Color = 'k';
hold on
hline = refline([0 140]);
hline.Color = 'k';
hold off    
xlabel('Time Series (Hours)') 
ylabel('CMH')
legend('Consumed','Distributed','Location','northwest')
title('Network - Consumed v/s Distributed ')

