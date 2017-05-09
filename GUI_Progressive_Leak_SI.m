  
% Constructing the Severity Matrix
combineslop= zeros(1,l);slopd= zeros(1,l);
for i=2:l
   combineslop(i)=abs(combine(i)-combine(i-1)); 
end
fstd=0.15;sstd=0.3;tstd=0.45;fostd=0.6;
% fstd = std(combineslop);
% sstd = 2*fstd;
% tstd= 3*fstd;
%mu1std = zeros(1,l);mu2std = zeros(1,l);mu3std = zeros(1,l);

slopd(1)=0.5;
for i=2:l
    if abs(combineslop(i))<fstd 
        n='0std';
             else if abs(combineslop(i))>=fstd && abs(combineslop(i))<sstd
              n='1std';
                 else if abs(combineslop(i))>=sstd && abs(combineslop(i))< tstd
                      n='2std';
                    else if abs(combineslop(i))>=tstd && abs(combineslop(i))<fostd
                         n='3std';
                    else if abs(combineslop(i))>=fostd 
                                n='4std';
                        end
                        end
                     end
                  end
    end

   
    switch n
    case '0std'
        slopd(i)=0.5; %Blue

    case  '1std'
       if combine(i)<=1.4                                       slopd(i)=1.5; %green
       else                                                 slopd(i)=2.5; %yellow
       end
       
    case '2std'
       if combine(i)<=1.15                                      slopd(i)=1.5; %green
        else  if combine(i)<=1.7                                 slopd(i)=2.5; %yellow
            else                                                   slopd(i)=3.5; %ORANGE
                  
              end
        end
   case '3std'
        if combine(i)<=1.4                                      slopd(i)=2.5; %yellow
        else  if combine(i)<=1                                   slopd(i)=3.5; %ORANGE
            else                                                   slopd(i)=4.5; %red
                  
              end
        end
         case '4std'
        if combine(i)<=1.15                                     slopd(i)=2.5; %yellow
        else  if combine(i)<=1.7                                   slopd(i)=3.5; %ORANGE
            else                                                   slopd(i)=4.5; %red
                  
              end
        end
    end % stiwtch case end
    if liky(i)==0.05 
        slopd(i)=0.5;
    end
end  
 


% plot severity
 subplot(2,2,3) 
 t=plot(days,slopd,'-','MarkerFaceColor','black');
  hold on
patch([max(xlim) max(xlim) 0 0],[0 1 1 0], [0 0.74902 1]) %blue
hold on
patch([max(xlim) max(xlim) 0 0],[1 2 2 1],[0.196078 0.803922 0.196078] )  %green
hold on 
patch([max(xlim) max(xlim) 0 0],[2 3 3 2], [1 1 0])  % orange
hold on
patch([max(xlim) max(xlim) 0 0],[3 4 4 3], [1 0.647059 0]) % yellow
hold on
patch([max(xlim) max(xlim) 0 0],[4 6 6 4 ], 'r')  % red
hold on
t=plot(days,slopd,'-','MarkerFaceColor','black');
t.Color='k';
xlabel('Time Series (Days)') 
ylabel('Severity')
set(t,'LineWidth',1.2);
hold off
title('Severity Indicator')


