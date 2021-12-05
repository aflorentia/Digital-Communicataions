function [xq, centers] = my_quantizer(x, N, min, max)
    
    x( x > max ) = max;
    x( x < min) = min;
    
    delta = (max - min)/2^N;
    centers = zeros ( N^2 , 1 );
    centers(N^2) = min + delta/2 ;
    for i = N^2-1 : -1 : 1
        centers(i) = centers(i+1) + delta ;
    end
   % centers(1) = centers(2) + delta/2
        %length(centers)

    xq = zeros(size(x,1),1);
    for i = 1 : length( x )
        for j = 1 : length(centers) 
          if x( i ) >= ( centers(j) + delta/2 )              
              xq( i ) = j;
              break;
          end
          xq( i ) = j;    %% anamesa min - delta/2 
         end
        
    end
    
end