clear; close all; clc;

[y,fs]=audioread('speech.wav');
%sound(y,fs)
%hist(y,fs)


min_value = -1;
max_value = 1;
N=6; %2,4,6
[xq, centers, D] = Lloyd_Max(y, N, min_value, max_value);

Kmax=length(D);

%% Ερώτημα Α
SQNR = zeros(Kmax,1);
for i = 1 : Kmax
    SQNR(i) = 10*log10(mean(y.^2)/D(i));
end

plot(1:Kmax,SQNR,'-x')
xlabel('K')
ylabel('SQNR')

%% Ερώτημα Β
%{
    Kmax=length(D);

    %% Ερώτημα Α
    SQNR = 10*log10(mean(y.^2)/mean((y-centers(xq)).^2));
    kappa(z,1) = Kmax;
    kappa(z,2)=SQNR;
    z=z+1;
end
plot( kappa(:,1), kappa(:,2) )
xlabel('K')
ylabel('SQNR')
%}
[ xqU , centersU] = my_quantizer(y,N,min_value,max_value);
SQNR_U = 10*log10(mean(y.^2)/mean((y-centersU(xqU)).^2))
SQNR_NU = SQNR(Kmax) 


%% Ερώτημα Γ
%[mu,sigma,muCI,sigmaCI] = normfit(y)
v = calcProp( y,fs,centers,xq,min_value,max_value )            %%  Need FIX!!! %%  Need FIX!!!%%  Need FIX!!!%%  Need FIX!!!
prob = practProp ( xq , centers );
H = -(prob.*log2(prob))



%% Ερώτημα Δ
Qy = centers(xq);       %%  Κβαντισμένο Σήμα
mse = mean ( (Qy - y).^2 )
