function [raw, sample] = demodulat (noisy)

    Tsymbol = 40;
    Tsample = 1;
    Tc = 4;
    fc = 1/Tc;
    
    gt = sqrt(2/Tsymbol);
    t = 0 :Tsample: Tsymbol-1 ;
    
    [M, N] = size(noisy);
    signalDim = M/Tsymbol;
    
    signal = zeros([M Tsymbol] );
    
    raw = zeros([signalDim ,N]);
    
    receiver=ones([1 length(t)]);
    receiver=receiver.*gt.*cos(2*pi*fc*t);
    %receiver=1/sqrt(Tsymbol);
    for n= 1 :N
       
        
        sample = zeros ([signalDim Tsymbol]);
        for i = 1: signalDim
            sample(i,:) = noisy(i*(t+1),n);            
        end
                
        signal = sample.*receiver;     
        
        for i= 1:size(signal,1)
            raw(i,n) = sum(signal(i,:),2);
        end
    end
   
    
end