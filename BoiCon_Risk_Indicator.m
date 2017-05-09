
% calculating the risk indicator
risk=zeros(1,l);
for i=1:l
    if likelyhood(i) ==0.05
        n='0-10 blue';
    else if likelyhood(i) ==0.2
          n='10-30 green';
           else if likelyhood(i) ==0.45
                   n='30-60 yellow';
                    else if  likelyhood(i) ==0.75
                                n='60-90 orange';
                           else if  likelyhood(i) ==0.9
                                   
                                n='greater than 90 Red';
                               end
                        end
                end
        end
    end
   
    switch n
    case '0-10 blue'
         if severity(i)==0.5                                           risk(i)=0.05; %Blue
         else if severity(i)==1.5  || severity(i)==2.5                 risk (i)=0.2;  %Green
             else if severity(i)==3.5 || severity(i)==4.5             risk(i)=0.45; %yellow
                  end
             end
         end
         
          case '10-30 green'
         if severity(i)==0.5  ||severity(i)==1.5                       risk (i)=0.2;  %Green
         else if severity(i)==2.5  || severity(i)==3.5                risk(i)=0.45; %yellow
             else if severity(i)==4.5                                 risk(i)=0.75; %orange
                  end
             end
         end
        
          case '30-60 yellow'
         if severity(i)==1                                           risk (i)=0.2;  %Green
         else if severity(i)==1.5  || severity(i)==2.5                risk(i)=0.45; %yellow
             else if severity(i)==3.5 || severity(i)==4.5            risk(i)=0.75; %orange
                  end
             end
         end
        
          case '60-90 orange'
         if severity(i)==0.5  ||severity(i)==1.5                       risk(i)=0.45; %yellow
         else if severity(i)==2.5  || severity(i)==3.5                  risk(i)=0.75; %orange
             else if severity(i)==4.5                                   risk(i)=0.9; %red
                  end
             end
         end
        
          case 'greater than 90 Red'
        if severity(i)==0.5                                          risk(i)=0.45; %yellow
         else if severity(i)==1.5  || severity(i)==2.5                 risk(i)=0.75; %orange
             else if severity(i)==3.5 || severity(i)==4.5                risk(i)=0.9; %red
                  end
             end
         end
        
         
    end % stiwtch case end
 end  % end for FOr loop
 
   %plot Risk Indicator
 subplot(2,2,4)
 t=plot(Days_BioCon,risk,'-','MarkerFaceColor','black');
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
t=plot(Days_BioCon,risk,'-','MarkerFaceColor','black');
t.Color='k';
xlabel('Time Series (Days)') 
ylabel('FNormalized')
set(t,'LineWidth',1.2);
hold off
title('Risk Indicator')
