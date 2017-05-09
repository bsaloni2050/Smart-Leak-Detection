clf
%plot F vs days 
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
ylabel('Normalized Data')
legend('F','FAnomaly','15%','40%','70%','Location','northeast')
title('Normalized Data v/s Days ')

Liklihood_Indc = uicontrol('Style', 'pushbutton', 'String', 'Liklihood_Indcator',...
        'Position', [20 10 150 20],...
        'Callback', 'GUI_Progressive_Leak_LI');  
     Severity_Indc = uicontrol('Style', 'pushbutton', 'String', 'Severity Indcator',...
        'Position', [250 10 150 20],...
        'Callback', 'GUI_Progressive_Leak_SI');  
     Risk_Indc = uicontrol('Style', 'pushbutton', 'String', 'Risk Indcator',...
        'Position', [520 10 150 20],...
        'Callback', 'GUI_Progressive_Leak_RI');  
     Message_show = uicontrol('Style', 'pushbutton', 'String', 'Message',...
        'Position', [820 10 150 20],...
        'Callback', 'Message_Details');
     Go_back = uicontrol('Style', 'pushbutton', 'String', 'Back',...
        'Position', [820 10 150 20],...
        'Callback', 'GUI_Progressive_Leak');