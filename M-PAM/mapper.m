function [code,sm] = mapper ( signal , k ,M,A)

    thesi = 1;
    code = zeros ([1,size(signal)]);
    
    for i = 1 : k : length( signal )
        deiktis = i;
        
        while deiktis < i+k-1
            code(thesi) = xor(signal(deiktis),signal(deiktis+1));
            deiktis = i+1;
            thesi = thesi+1;
        end
        code(thesi) = signal(deiktis);
        thesi = thesi+1;
        
    end
    code = double ( code' );
    
    sm= zeros([1,length(signal)/k]);
    second=1;
    alpha = calculateGreyIP(M,k);
    
    for i = 1:k:length(signal)
        
        temp=flip(signal(i:i+k-1));
        temp = string(temp');
        temp = join(temp,'');
        temp = double(temp);

        for y=1:length(alpha)
            if temp==alpha(y,2)
                sm(second) = alpha(y,1);
                second=second+1;
                break;
            end
        end
        
    end
    
%    sm = cell2mat(sm');
    sm = sm*A;

end