
 % Constructing the Likelihood Matrix
%  z_fifteen = zeros(1,l);fift_forty = zeros(1,l);forty_seventy = zeros(1,l);
%  seventy_hundred = zeros(1,l);
liky=zeros(1,l);
for i=1:l
     if combine(i)<= 1.15
             liky(i)=0.05; %blue
     else if combine(i)<=1.40 && combine(i)> 1.15
               liky(i)=0.2; % green
         else if combine(i)<=1.70 && combine(i)> 1.40
            liky(i)=0.45; % yellow
         else if combine(i)>1.70 && combine(i)<= 1
             liky(i)=0.75; % orange
                else if combine(i)>1
                    liky(i)=0.95; % red
                    end
             end
             end
                  
         end
     end
end

 
 
% plot likelihood
 subplot(2,2,2) 
 t=plot(days,liky,'-','MarkerFaceColor','black');
 hold on
patch([max(xlim) max(xlim) 0 0],[0 0.115 0.115 0], [0 0.74902 1]) %blue
hold on
patch([max(xlim) max(xlim) 0 0],[0.1 0.3 0.3 0.1],[0.196078 0.803922 0.196078] )  %green
hold on 
patch([max(xlim) max(xlim) 0 0],[0.3 0.6 0.6 0.3], [1 1 0])  % orange
hold on
patch([max(xlim) max(xlim) 0 0],[0.6 0.9 0.9 0.6], [1 0.647059 0]) % yellow
hold on
patch([max(xlim) max(xlim) 0 0],[0.9 1 1 0.9], 'r')  % red
hold on
t=plot(days,liky,'-','MarkerFaceColor','black');
t.Color='k';
xlabel('Time Series (Days)') 
ylabel('FNormalized')
set(t,'LineWidth',1.2);
hold off
title('Likelihood Indicator')
