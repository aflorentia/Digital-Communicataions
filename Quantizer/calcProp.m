function v = calcProp ( y , fs ,centers ,xq,min,max)    %%  Need FIX!!!%%  Need FIX!!!%%  Need FIX!!!
    %hist(y,fs)
    m = mean(y);
    sigms = var(y);
    
    syms x;
    pdf = ( 1 / sqrt(2*pi*sigms))*exp(-(x-m)^2/(2*sigms));
   
    a=min;
    temp=sort(centers);
   
    for i = 1 : length(centers)-1
        b= temp(i)+temp(i+1)/2;
        %b= centers(i) + centers(i+1)/2;

        
      %  pdf(i) = ( 1 / sqrt(2*pi*s))*exp(-(x-m)^2/(2*s));
      
        pr(i) = vpaintegral (pdf,b,a);
        a=b;
    end
    pr(i+1) = vpaintegral (pdf,max,b);

    v=double(pr)
end