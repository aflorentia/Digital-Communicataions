clear; close all; clc;

import my_quantizer.*

%%%%%%%%%%%%%%%    Πηγή Α     %%%%%%%%%%%%%%
M=10000;
t = (randn(M,1)+1i*randn(M,1))/sqrt(2);
x= abs(t) .^ 2;

min_value = 0; max_value = 4;
N = 4; %6 bits.

[ xq , centers] = my_quantizer(x,N,min_value,max_value);

figure;
subplot(2,1,1)
plot(x);
title('Signal')
subplot(2,1,2)
plot(centers(xq));
title('Quantized Signal')

SQNR = 10*log10(mean(x.^2)/mean((x-centers(xq)).^2))

QuantNoise = mean( (x - centers(xq)).^2)
CQuantNoise = computeNoise ( centers , N , min_value ,max_value )       %%  Need FIX!!!%%  Need FIX!!!%%  Need FIX!!!%%  Need FIX!!!
%eer=errmean(centers(xq))

distOverload = ( numel(x(x<min_value)) + numel(x(x>max_value)))/numel(x)


function CQuantNoise = computeNoise ( centers , N , min ,max )      %%  Need FIX!!!%%  Need FIX!!!%%  Need FIX!!!%%  Need FIX!!!
    
    syms x;
    pdf = exp(-x);
    delta = (max - min)/2^N;
    temp = zeros([ 2^N 1 ]);
    for i = 1 : N^2
        
        fx=(x-centers(i))^2*pdf;
        
        down = (i-1)*delta;
        upper = min + (i*delta);
        
        temp(i) =  vpaintegral(fx,down, upper) ;
    end   
    sumNoise = sum(temp);
    last = length(centers);
    Plus = (x-centers(last))^2.*pdf;
    aPlus = vpaintegral( Plus,x, max , inf) ;
    CQuantNoise = sumNoise + aPlus;
    CQuantNoise = double(CQuantNoise);
end