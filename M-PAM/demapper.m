function signal = demapper ( seq , alpha)
    for i = 1 : length(seq)
       for y = 1 : length(alpha)     
           if seq(i)== (alpha(y,1))%        seq(i)== cell2mat(alpha(y,1))
                signal(i)=((alpha(y,2)))';    %string(cell2mat(alpha(y,2)))';
           end
            
       end
    end
    
end