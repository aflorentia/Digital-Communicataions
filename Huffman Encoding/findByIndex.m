function x = findByIndex( index , dictionary)
    
        keys = length ( dictionary );
        for i=1 : keys
            if isequal(dictionary{i,2},index)
                x = i;
                return;
            end
            
        end
        x= [];
end