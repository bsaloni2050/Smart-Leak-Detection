[Y,M,D,H,~,~] = datevec(Index);
year=2012;
month= 8;
min=5000;
day=7;
minm= zeros(3);

for i=1:30

        minm(i)= Function_for_MNF_each day(year,month,min)
end

function x= Function_for_MNF_each day(year,month,min)
        for i=2:length(H)
            if (Y(i)== year) && (M(i)== month) && ( D(i)== day) &&(H(i) > 14) && (H(i) < 18)
               if (Value(i)< min)
                min=Value(i);
               end 
            end
        end
     min=5000;
end

    