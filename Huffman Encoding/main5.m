clear; close all; clc;

import myHuffmanDict.*
import myHuffmanCode.*
import myHuffmanDeco.*
import findByIndex.*
import SecondOrderExpansion.*
import calculateProp.*
import processInput.*


alphabet=["a",'b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
prob=[0.08167,0.01492,0.02782,0.04253,0.12702,0.02228,0.02015,0.06094,0.06966,0.00153,0.00772,0.04025,0.02406,0.06749,0.07507,0.01929,0.00095,0.05987,0.06327,0.09056,0.02758,0.00978,0.02360,0.00150,0.01974,0.00075];


[ secondAlphabet , secondProb ] = SecondOrderExpansion ( alphabet , prob );

[ dict, avgLengthDictA ] = myHuffmanDict(secondAlphabet , secondProb);
clc;
%%%%%%%%%%%%%%%%%%%      Πηγή Β      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    fileID = fopen('kwords.txt','r');
    %asciiEsc = char (45);

    readSig = fscanf(fileID, '%s' );
    fclose(fileID);

    tempSigB = processInput ( readSig , alphabet );
   % inputSigB = cellstr ( inputSigB );
   
   %%%%%%  inputSigB from char to stringCell %%%%%%
   inputSigB = [] ;
    for i=1:2:length ( tempSigB )
        inputSigB = [ inputSigB ; tempSigB(i), tempSigB(i+1)];
        
    end
    inputSigB=string(inputSigB);
    inputSigB=cellstr(inputSigB);


    
 %%%%%%%%%%%%%%%%5%%%%  Huffman για Πηγή Β  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 

    encodeB = myHuffmanCode( inputSigB, dict );
    sigB = myHuffmanDeco( encodeB , dict );
    
    isequal(inputSigB(1:length(sigB)),sigB)   
    encoLengthB = length ( encodeB )
  
%%%%%%%%%%%%%%%%%%%% Υπολογισμός Πιθανότητας για Πηγή Β  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    
    Cprob = calculateProp ( inputSigB , secondAlphabet );
   
%%%%%%%%%%%%%%%%5%%%%  Huffman για Πηγή Β με custom πιθανότητα %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [ Cdict, avgLengthDictB ] = myHuffmanDict(secondAlphabet , Cprob);
    clc;
   

    CencodeB = myHuffmanCode( inputSigB, Cdict );
    CencoLengthB = length ( CencodeB )
 