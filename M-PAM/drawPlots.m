function drawPlots ( BER , SER )
snr=0:5:40;
figure()
% semilogy( snr, BER(:,:,1),'-ob', snr ,BER(:,:,2), '-*m');
slg1 = semilogy( snr, BER(:,:,1),'-ob');
hold on;
slg2 = semilogy( snr ,BER(:,:,2), '-*m');
hold off;
xlabel( 'SNR' );
ylabel( 'BER' );
lgd = legend ([slg1(1) slg2(2)],{'2,4,8,16 Binary ','2,4,8,16 Gray '},'Location','southwest','NumColumns',1);
title(lgd,'M-PAM Systems')
title( 'BER Measurements' )
grid on;
figure()
% semilogy( snr, SER(:,:,1), '-ob', snr ,SER(:,:,2), '-*m');
slg1 = semilogy( snr, SER(:,:,1),'-ob');
hold on;
slg2 = semilogy( snr ,SER(:,:,2), '-*m');
hold off;
xlabel( 'SNR' );
ylabel( 'SER' );
lgd = legend ([slg1(1) slg2(2)],{'2,4,8,16 Binary ','2,4,8,16 Gray '},'Location','southwest','NumColumns',1);
title(lgd,'M-PAM Systems')
title( 'SER Measurements' )
grid on;
end