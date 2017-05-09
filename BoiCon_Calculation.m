clf
l= length(Days_BioCon); c=0; sum=0;
Clean= zeros(1,l); Normalized_clean= zeros(1,l);
anomaly=zeros(1,l);Normalized_anomaly= zeros(1,l);
combine=zeros(1,l); likelyhood= zeros(1,l);
severity=zeros(1,l); risk=zeros(1,l);

% segragate Data
for i=1:l
    if Orginal(i)<145 
        anomaly(i)=Orginal(i);
        Clean(i)=0;
    else 
        Clean(i)=Orginal(i);
        anomaly(i)=0; 
    end
end
    
%find the Average of Clean Data
%Mu=mean(Clean);
for i=1:l
    if anomaly(i)==0
        sum=Clean(i)+sum;
         c=c+1;
    end
end
Mu=sum/c;

%Find the Normalized Data
for i=1:l
  if (Clean(i)~=0)
   Normalized_clean(i) =(Clean(i)/Mu); 
    else
   Normalized_anomaly(i)= anomaly(i)/Mu;
  end
end


%Re-checking anomaly and clean Data based on MU
for i=1:l
    if Normalized_clean(i)>=0.96
      Normalized_anomaly(i)=Normalized_clean(i);
        Normalized_clean(i)=0;
    end
    if  Normalized_anomaly(i)<0.96
        Normalized_clean(i)=Normalized_anomaly(i);
        Normalized_anomaly(i)=0;
    end
end

%combine data for plotting
for i=1:l
    if (Normalized_clean(i)~=0)
        combine(i)=Normalized_clean(i);
    else
     combine(i)=Normalized_anomaly(i);
    end
end


%calculations for 1 day before
for i=1:l
    if anomaly(i)~=0
        index=i;
        anomaly(i-1)=Normalized_clean(i-1);
        Normalized_clean(i-1)=0;
        break;
    end
end
% plot garphs
 subplot(2,2,1)
plot(Days_BioCon(Normalized_clean~=0),Normalized_clean(Normalized_clean~=0),'*');
hold on
plot(Days_BioCon(Normalized_anomaly~=0),Normalized_anomaly(Normalized_anomaly~=0),'*');
hold on
hline = refline([0 1]);
hline.Color = [0.196078 0.803922 0.196078];   % green
hold on
hline = refline([0 0.96]);
hline.Color = 'b';
hold on
hline = refline([0 0.9]);
hline.Color = 'y';
hold on
hline = refline([0 0.8]);  % orange
hline.Color = [0.721569 0.52549 0.0431373];
hold on
hline = refline([0 0.7]);
hline.Color = 'r';
hold off    
xlabel('Time Series ') 
ylabel('F Normalized')
legend('F','FAnomaly','1%','4%','10%','20%','30%','Location','southwest')
title('F Normalized v/s Days ')

%calculte Delta S

for i=2:l
    slop(i)=combine(i)-combine(i-1);
end
disp (std(Normalized_clean))

std1= std(slop); 
std2= 2*std1;
std3= 3*std1;
std4= 4*std1;

% %plot delta S
% subplot(1,2,2)  
% plot(Days_BioCon(slop~=0),slop(slop~=0),'*-');
% hold on
% hline = refline([0 std1]);
% hline.Color = 'g';
% hold on
% hline = refline([0 std2]);
% hline.Color = 'b';
% hold on
% hline = refline([0 std3]);
% hline.Color = 'y';
% hold on
% hline = refline([0 std4]);
% %hline.Color = [1 1 0];
% 
% hold on
% hline = refline([0 0]);
% hline.Color = 'k';
% hold off    
% xlabel('Time Series (Days)') 
% ylabel(' Slope Values')
% legend('Series 1','1 STD','2 STD','3 STD','4 STD','Location','northwest')
% title('Slope v/s Days ')
%     

 Liklihood_Indc = uicontrol('Style', 'pushbutton', 'String', 'Liklihood_Indcator',...
        'Position', [20 10 150 20],...
        'Callback', 'BoiCon_Liklihood_Indicator');  
     Severity_Indc = uicontrol('Style', 'pushbutton', 'String', 'Severity Indcator',...
        'Position', [250 10 150 20],...
        'Callback', 'BoiCon_Severity_Indicator');  
     Risk_Indc = uicontrol('Style', 'pushbutton', 'String', 'Risk Indcator',...
        'Position', [520 10 150 20],...
        'Callback', 'BoiCon_Risk_Indicator');  
     Message_show = uicontrol('Style', 'pushbutton', 'String', 'Message',...
        'Position', [820 10 150 20],...
        'Callback', 'Message_Details');
     Main_page =uicontrol('Style', 'pushbutton', 'String', 'Main Menu',...
        'Position', [820 10 150 20],...
        'Callback', 'button_testing');
      Back =uicontrol('Style', 'pushbutton', 'String', 'Back',...
        'Position', [1120 10 150 20],...
        'Callback', 'GUI_BioCon_Main_Page');

