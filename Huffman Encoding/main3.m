clear; close all; clc;

import myHuffmanDict.*
import myHuffmanCode.*
import myHuffmanDeco.*
import findByIndex.*


alphabet=["a",'b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];

%%%%%%%%%%%%%%%%%%%      Πηγή Β      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    fileID = fopen('kwords.txt','r');
    %asciiEsc = char (45);

    readSig = fscanf(fileID, '%s' );

    fclose(fileID);

    tempSigB = processInput ( readSig , alphabet );
   % inputSigB = cellstr ( inputSigB );
   
   %%%%%%  inputSigB from char to stringCell %%%%%%
    inputSigB = [] ;
    for i=1:length ( tempSigB )
        inputSigB = [ inputSigB ; tempSigB(i)];
    end
    inputSigB=string(inputSigB);
    inputSigB=cellstr(inputSigB);
    
%%%%%%%%%%%%%%%%%%%% Υπολογισμ�?ς Πιθαν�?τητας για Πηγή Β  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    
    Cprob = calculateProp ( inputSigB , alphabet );
    
    tempEntropy = zeros([length(Cprob) 1]);
    for h = 1: length(alphabet)
        tempEntropy(h) = Cprob(h)*log2(1/Cprob(h));
    end
    entropyB=sum(tempEntropy);
%%%%%%%%%%%%%%%%5%%%%  Huffman για Πηγή Β με custom πιθαν�?τητα %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [dict,avgLengthDict] = myHuffmanDict(alphabet , Cprob);
    clc;
   

    encodeB = myHuffmanCode( inputSigB, dict );
    sigB = myHuffmanDeco( encodeB , dict );



    %{
    disp('Encoded Message');
    code'

    disp('Decoded Message');
    sig'
    %} 

    isequal(inputSigB(1:length(sigB)),sigB)     %%%%%Testing Testing!!!!

    encoLengthB = length ( encodeB )




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
    
    prop = prop ./ sum(prop)

end