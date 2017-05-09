
% calculate the severity Matrix
for i=1:l
    if i <=6
        n='0 to 1';
    else if i<=18
          n='1 to 3';
           else if i<=60
                   n='3-12';
                    else if  i<=140
                            
                                n='12 to 24';
                           else if  i<=250
                                n='greater than 24';
                               end
                        end
                end
        end
    end
   
    switch n
    case '0 to 1'
         if combine(i)>0.96                                            severity(i)=0.5; %Blue
         else if combine(i)<=0.96  || combine(i)>0.9                   severity (i)=1.5;  %Green
             else if combine(i)<=0.9  ||combine(i)>0.8                 severity (i)=1.5;  %Green
                     else if combine(i)<=0.8  ||combine(i)>0.7          severity(i)=2.5; %yellow
                              else if combine(i)<=0.7                  severity(i)=2.5; %yellow
                                  end
                         end
                 end
             end
         end
         
         case '1 to 3'
         if combine(i)>0.96                                            severity(i)=0.5; %Blue
         else if combine(i)<=0.96  || combine(i)>0.9                   severity (i)=1.5;  %Green
             else if combine(i)<=0.9  ||combine(i)>0.8                 severity(i)=2.5; %yellow
                     else if combine(i)<=0.8  ||combine(i)>0.7         severity(i)=2.5; %yellow
                              else if combine(i)<=0.7                 severity(i)=3.5; %orange
                                  end
                         end
                 end
             end
         end
         case '3-12'
         if combine(i)>0.96                                            severity(i)=0.5; %Blue
         else if combine(i)<=0.96  || combine(i)>0.9                  severity(i)=2.5; %yellow
             else if combine(i)<=0.9  ||combine(i)>0.8                 severity(i)=2.5; %yellow
                     else if combine(i)<=0.8  ||combine(i)>0.7         severity(i)=3.5; %orange
                              else if combine(i)<=0.7                    severity(i)=3.5; %orange
                                  end
                         end
                 end
             end
         end
         case '12 to 24'
         if combine(i)>0.96                                            severity(i)=0.5; %Blue
         else if combine(i)<=0.96  || combine(i)>0.9                    severity(i)=2.5; %yellow
             else if combine(i)<=0.9  ||combine(i)>0.8                   severity(i)=3.5; %orange
                     else if combine(i)<=0.8  ||combine(i)>0.7         severity(i)=3.5; %orange
                              else if combine(i)<=0.7                  severity(i)=4.5; %red
                                  end
                         end
                 end
             end
         end
         case 'greater than 24'
         if combine(i)>0.96                                            severity(i)=0.5; %Blue
         else if combine(i)<=0.96  || combine(i)>0.9                  severity(i)=1.5; %yellow
             else if combine(i)<=0.9  ||combine(i)>0.8                  severity(i)=2.5; %orange
                     else if combine(i)<=0.8  ||combine(i)>0.7        severity(i)=4.5; %red
                              else if combine(i)<=0.7                  severity(i)=4.5; %red
                                  end
                         end
                 end
             end
         end
                  
   
    end % stiwtch case end
 end  % end for FOr loop
 
  %plot severity
 subplot(2,2,3)
 t=plot(Days_BioCon,severity,'-','MarkerFaceColor','black');
 hold on
patch([max(xlim) max(xlim) 0 0],[0 1 1 0],[0.196078 0.803922 0.196078] )  %green
hold on
patch([max(xlim) max(xlim) 0 0],[1 2 2 1 ], [0 0.74902 1]) %blue
hold on 
patch([max(xlim) max(xlim) 0 0],[2 3 3 2], [1 1 0])  % orange
hold on
patch([max(xlim) max(xlim) 0 0],[3 4 4 3 ], [1 0.647059 0]) % yellow
hold on
patch([max(xlim) max(xlim) 0 0],[4 6 6 4], 'r')  % red
hold on
t=plot(Days_BioCon,severity,'-','MarkerFaceColor','black');
t.Color='k';
xlabel('Time Series (Days)') 
ylabel('Severity')
set(t,'LineWidth',1.2);
hold off
title('Severity Indicator')

