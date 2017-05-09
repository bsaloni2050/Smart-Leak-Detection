clc
% Calculate the likelihood indicator
X = zeros(5);
for i=1:l
    if i <=10
        n='first hour';
    else if i<=20
          n='second hour';
           else if i<=30
                   n='third hour';
                    else if  i<=40
                                n='fourth hour';
                           else if  i<=50
                                n='fifth hour';
                               end
                        end
                end
        end
    end
   
    switch n
    case 'first hour'
         if combine(i)>0.96                                            likelyhood(i)=0.05;       X(1,1)=i; %Blue 
         else if combine(i)<=0.96  || combine(i)>0.9                   likelyhood (i)=0.2;       X(2,1)=i  %Green
             else if combine(i)<=0.9  ||combine(i)>0.8                 likelyhood (i)=0.2;       X(3,1)=i %Green
                     else if combine(i)<=0.8  ||combine(i)>0.7          likelyhood(i)=0.45;     X(4,1)=i %yellow
                              else if combine(i)<=0.7                  likelyhood(i)=0.45;      X(5,1)=i %yellow
                                  end
                         end
                 end
             end
         end
         
         case 'second hour'
         if combine(i)>0.96                                            likelyhood(i)=0.05; %Blue
         else if combine(i)<=0.96  || combine(i)>0.9                   likelyhood (i)=0.2;  %Green
             else if combine(i)<=0.9  ||combine(i)>0.8                 likelyhood(i)=0.45; %yellow
                     else if combine(i)<=0.8  ||combine(i)>0.7         likelyhood(i)=0.45; %yellow
                              else if combine(i)<=0.7                 likelyhood(i)=0.75; %orange
                                  end
                         end
                 end
             end
         end
         case 'third hour'
         if combine(i)>0.96                                            likelyhood(i)=0.05; %Blue
         else if combine(i)<=0.96  || combine(i)>0.9                  likelyhood(i)=0.45; %yellow
             else if combine(i)<=0.9  ||combine(i)>0.8                 likelyhood(i)=0.45; %yellow
                     else if combine(i)<=0.8  ||combine(i)>0.7         likelyhood(i)=0.75; %orange
                              else if combine(i)<=0.7                    likelyhood(i)=0.75; %orange
                                  end
                         end
                 end
             end
         end
         case 'fourth hour'
         if combine(i)>0.96                                            likelyhood(i)=0.05; %Blue
         else if combine(i)<=0.96  || combine(i)>0.9                    likelyhood(i)=0.45; %yellow
             else if combine(i)<=0.9  ||combine(i)>0.8                   likelyhood(i)=0.75; %orange
                     else if combine(i)<=0.8  ||combine(i)>0.7         likelyhood(i)=0.75; %orange
                              else if combine(i)<=0.7                  likelyhood(i)=0.9; %red
                                  end
                         end
                 end
             end
         end
         case 'fifth hour'
         if combine(i)>0.96                                            likelyhood(i)=0.05; %Blue
         else if combine(i)<=0.96  || combine(i)>0.9                  likelyhood(i)=0.45; %yellow
             else if combine(i)<=0.9  ||combine(i)>0.8                  likelyhood(i)=0.75; %orange
                     else if combine(i)<=0.8  ||combine(i)>0.7        likelyhood(i)=0.9; %red
                              else if combine(i)<=0.7                  likelyhood(i)=0.9; %red
                                  end
                         end
                 end
             end
         end
                  
   
    end % stiwtch case end
 end  % end for FOr loop
 
  %plot likelihood
 subplot(2,2,2)
 t=plot(Days_BioCon,likelyhood,'-','MarkerFaceColor','black');
 hold on
patch([max(xlim) max(xlim) 0 0],[0 0.1 0.1 0],[0.196078 0.803922 0.196078] )  %green
hold on
patch([max(xlim) max(xlim) 0 0],[0.1 0.3 0.3 0.1], [0 0.74902 1]) %blue
hold on 
patch([max(xlim) max(xlim) 0 0],[0.3 0.6 0.6 0.3], [1 1 0])  % orange
hold on
patch([max(xlim) max(xlim) 0 0],[0.6 0.9 0.9 0.6], [1 0.647059 0]) % yellow
hold on
patch([max(xlim) max(xlim) 0 0],[0.9 1 1 0.9], 'r')  % red
hold on
t=plot(Days_BioCon,likelyhood,'-','MarkerFaceColor','black');
t.Color='k';
xlabel('Time Series (Days)') 
ylabel('FNormalized')
set(t,'LineWidth',1.2);
hold off
title('Likelihood Indicator')

%  subplot(1,2,1)
% f = figure;
% t = uitable(f,'Data',likelyhood,'Position',[20 20 262 204]);

%  Severity_Indc = uicontrol('Style', 'pushbutton', 'String', 'Severity Indcator',...
%         'Position', [250 10 150 20],...
%         'Callback', 'BoiCon_Severity_Indicator');  
%      Risk_Indc = uicontrol('Style', 'pushbutton', 'String', 'Risk Indcator',...
%         'Position', [520 10 150 20],...
%         'Callback', 'BoiCon_Risk_Indicator');  
%      Message_show = uicontrol('Style', 'pushbutton', 'String', 'Message',...
%         'Position', [820 10 150 20],...
%         'Callback', 'Message_Details');
%      Analysis = uicontrol('Style', 'pushbutton', 'String', 'Analyze the data here',...
%         'Position', [820 10 150 20],...
%         'Callback', 'BoiCon_Calculation');
