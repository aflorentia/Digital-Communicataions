function prop = calculateProp ( input , alphabet )
    
    prop = zeros ( size(alphabet) ) ;
    for i = 1 : length ( alphabet )
        temp = 0 ; 
        for j = 1 : length ( input )
            if input ( j ) == alphabet (i)
                temp = temp + 1;
            end
        prop(i) = temp ;
        end 
    end
    
    prop = prop ./ sum(prop);
end