function sn = carrier ( ri, sm )

    distance = zeros(size(sm));
    sn = zeros(size(sm));

    for i = 1 : length(ri)
        for y = 1: length(sm)
            distance(y) = sqrt( sum(sm(y)- ri(i) )^2 );
        end
        %distance
        
        [M,N]=min(distance);
        
        sn(i)=N;
    end
   %unique(sn)
end