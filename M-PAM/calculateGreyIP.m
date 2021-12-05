function alpha = calculateGreyIP(M,k)
    
    alpha = [-M+1:2:-1 1:2:M-1];
    alpha = alpha';
    %alpha = num2cell(alpha);
    ip = [0:M-1];   % decimal equivalent of a k=log2(M)-bit binary word 
    ipBin = dec2bin(ip.') ;
    ipDec = bin2dec(ipBin(:,[1:k])); % scatter plot without Gray coding
    ipGray = bitxor(ipDec, floor(ipDec/2));
    greyCode = de2bi (ipGray);
   %{
    greyCode = string(greyCode);
    greyCode = cellstr(greyCode);
    alpha(:,2)=greyCode;
    %}
    alpha = [alpha greyCode];


end