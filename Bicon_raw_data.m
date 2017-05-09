%Orginal=Orginal1;
subplot(1,2,1)
plot(Days_BioCon,Orginal,'*');
xlabel('Time Series ') 
ylabel('Raw Data')
legend('Raw Data','Location','southwest')
title('Raw Data v/s Days ')

% initialization of values
global l;
l= length(Days_BioCon); c=0; sum=0;

Clean= zeros(1,l); Normalized_clean= zeros(1,l);
anomaly=zeros(1,l);Normalized_anomaly= zeros(1,l);
combine=zeros(1,l); likelyhood= zeros(1,l);
severity=zeros(1,l); risk=zeros(1,l);

% Threshold Data
for i=1:l
    if Orginal(i)<145 
        anomaly(i)=Orginal(i);
        Clean(i)=0;
    else 
        Clean(i)=Orginal(i);
        anomaly(i)=0; 
    end
end
    
% Find the Average of Clean Data
% Mu=mean(Clean);
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