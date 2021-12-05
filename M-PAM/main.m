clear; clc; close all;


M = 4; %4 8 16
A = sqrt(3/(M^2-1));
k = log2(M);
Eb = 1/log2(M);

Lb=12*10^2;
binSignal = randsrc(Lb,1,[0 1]);

[grayC,sm] = mapper(binSignal, k,M,A);
   % figure;
   % stem(sm,':')
st = modulat ( sm );
    %figure;
    %plot(st);

SNR=0:10*log10(5):10*log10(40);

noisy = AWGN( SNR, Eb, st, Lb, M );

    %figure;
    %plot(noisy)
    %hist(noisy);
[r,signal] = demodulat(noisy);
    %figure;
    %plot(r)
    %histogram(r);
alpha = calculateGreyIP(M,k);
%sk = cell2mat(alpha(:,1));
sk =  (alpha(:,1));

sn = zeros(size(r));

for i = 1: length(SNR)
    sn(:,i) = carrier(r(:,i),sk);
    final(:,i) = demapper(sn(:,i),alpha);
end

