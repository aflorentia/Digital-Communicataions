clear; close all; clc;

import myHuffmanDict.*
import myHuffmanCode.*
import myHuffmanDeco.*
import findByIndex.*
import SecondOrderExpansion.*


alphabet=["a",'b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
prob=[0.08167,0.01492,0.02782,0.04253,0.12702,0.02228,0.02015,0.06094,0.06966,0.00153,0.00772,0.04025,0.02406,0.06749,0.07507,0.01929,0.00095,0.05987,0.06327,0.09056,0.02758,0.00978,0.02360,0.00150,0.01974,0.00075];


[ secondAlphabet , secondProb ] = SecondOrderExpansion ( alphabet , prob );

[ dict , avgLengthDict ] = myHuffmanDict(secondAlphabet , secondProb);
clc;


%%%%%%%%%%%%%%%%%%%   2ης Τάξης Επέκταση  Α      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    inputSigA = randsrc(5000,1,[1:numel(secondAlphabet); secondProb]);

    %%%%%%  inputSig from double to stringCell %%%%%%
    for i=1:5000
        word([i],:) = [secondAlphabet{inputSigA(i,:)}];
    end
    STR=string(word);
    inputSigA=cellstr(STR);

    
%%%%%%%%%%%%%%%%5%%%%  Huffman 2ης Τάξης Επέκταση  Α   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    encodeA = myHuffmanCode( inputSigA, dict );
    sigA = myHuffmanDeco( encodeA , dict );

    isequal(inputSigA(1:length( sigA )),sigA)             
    encoLengthA = length ( encodeA )






