
 % Calculate the Risk indicator
 
 l1=0.05;l2=0.2;l3=0.45;l4=0.75;l5=0.95;
 risk_Indicator= zeros(1,l);
 for i=1:l
    if liky(i)==0.05                    risk_Indicator(i)=0.05; %Blue
    else if liky(i)==l2                  n='Row2';
         else if liky(i)==l3             n='Row3';
               else if liky(i)==l4       n='Row4';
                   else                  n='Row5';             
                    end
               end
        end
    end
 
 
    switch n
      case  'Row2'
       if slopd(i)<=1.5                                            risk_Indicator(i)=0.2; %green
       else                                                        risk_Indicator(i)=0.45; % Yellow
              
       end
    case 'Row3'
       if slopd(i)==0.5                                              risk_Indicator(i)=0.2; %green
              else if slopd(i)<=2.5                                risk_Indicator(i)=0.45; % Yellow
                  else                                            risk_Indicator(i)=0.75; % Orange
                  end
        end
    case 'Row4'
        if slopd(i)<=1.5                                           risk_Indicator(i)=0.45; %Yellow
        else  if slopd(i)<=3.5                                     risk_Indicator(i)=0.75; % Orange
            else                                                      risk_Indicator(i)=0.95; % Red
             end
        end
   case 'Row5'
        if slopd(i)==0.5                                          risk_Indicator(i)=0.45; %Yellow
              else  if slopd(i)<=2.5                               risk_Indicator(i)=0.75; % Orange
                  else                                              risk_Indicator(i)=0.95; % Red
                   end
                  
        end
    end % stiwtch case end
    if liky(i)==0.05                    risk_Indicator(i)=0.05; %Blue
    end
 end

 
 %plot Risk
 subplot(2,2,4) 
t=plot(days,risk_Indicator,'-','MarkerFaceColor','black');
 hold on
patch([max(xlim) max(xlim) 0 0],[0 0.1 0.1 0],[0 0.74902 1]) %blue
hold on
patch([max(xlim) max(xlim) 0 0],[0.1 0.3 0.3 0.1],[0.196078 0.803922 0.196078] )  %green
hold on 
patch([max(xlim) max(xlim) 0 0],[0.3 0.6 0.6 0.3], [1 1 0])  % orange
hold on
patch([max(xlim) max(xlim) 0 0],[0.6 0.9 0.9 0.6], [1 0.647059 0]) % yellow
hold on
patch([max(xlim) max(xlim) 0 0],[0.9 1 1 0.9], 'r')  % red
hold on
t=plot(days,risk_Indicator,'-','MarkerFaceColor','black');
t.Color='k';
set(t,'LineWidth',1.2);
xlabel('Time Series (Days)') 
ylabel('FNormalized')
hold off
title('Risk Indicator')