function correctedInput = processInput( input , alphabet )

    wrongAlpha = unique ( input );
    keys = length ( input );

    while ~(wrongAlpha(1)==alphabet(1))
        index = wrongAlpha(1);
        y=1;
        while  y <= keys 
            if isequal(input(y),index)
                
                input(y) = [];
                keys = keys-1;
            end
            y=y+1;

        end
        
        wrongAlpha = unique ( input );
        
    end
    correctedInput = input ;
end
