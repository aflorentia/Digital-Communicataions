function signal = modulat ( sm )
    Tsymbol = 40;
    Tsample = 1;
    Tc = 4;
    fc = 1/Tc;
    
    gt = sqrt(2/Tsymbol);
    t = 0 :Tsample: Tsymbol-1 ;
    signal = zeros([length(sm) Tsymbol] );
    for i = 1 :length(sm)
        signal(i,t+1) = sm(i)*gt* cos(2*pi*fc*t);     %%μονοδιαστατα ως προς τον χρόνο Ανεξάρτητη μεταβλητή t.
    end
    
    
    
    %{
    tend= 1 : Tsample : Tsymbol*length(sm);
    figure;
    plot(signal(:),'g')
    %}
    
end