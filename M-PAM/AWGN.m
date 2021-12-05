function noisy = AWGN ( SNR, Eb, signal, Lb, M )

    sigma = sqrt(Eb/2 *10.^(-SNR/10));
    noise = sqrt(sigma.^2).*randn(Lb/log2(M).*40,1);
    
    N=Lb/log2(M);
    No=Eb./(10.^(SNR/10));
    noise = sqrt(No/2).*randn(N*40,1);
    
    noisy = zeros(size(noise));
    for snr = 1 :length(SNR)
        pc=1;
        for i= 1 : size(signal,1)
            noisy(pc:pc+39,snr) = noise(pc:pc+39,snr) + signal(i,:)' ;
            pc=pc+40;
        end
    end
end