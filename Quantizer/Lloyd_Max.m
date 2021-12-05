function [xq, centers, D] = Lloyd_Max(x, N, min, max)
    e = 10^(-10);       %% 6 - 16
    [xq, centers] = my_quantizer(x, N, min, max);
    M = length (centers);
    T=zeros(M,1);
    
    x( x > max ) = max;
    x( x < min) = min;
    
    i=1;
    D = [0;0;0];
    while 1
        
        for k = 1 : M-1
            T(k,i) = ( centers(k)+centers(k+1) )/2;
        end
        T(M,i) = min;
        T(M+1,i) = max;
        T(:,i) = sort(T(:,i));
        
        k=i;        
        for h = 1 : length( x )
            for j = 1 : length(centers) 
              if x( h ) <= T(j+1,k)            
                  xq( h ) = j;
                  break;
              end
              xq( h ) = j;    %% anamesa max - +oo 
            end        
        end
        x;
        T(:,k);
        centers;
        D(i) = mean( (x - centers(xq)).^2);
        
        for k = 2 : N^2
        %%   T(k:k+1,i) checking checking
            centers(k) = mean( T(k-1:k,i));
        end
       % centers
        
        
        
        
        if i > 1
            if abs(D(i) - D(i-1)) < e
                break;
            end
        end
        
        i=i+1;        
    end
    %D
      
    
   
end