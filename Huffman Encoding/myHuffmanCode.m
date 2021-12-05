
function code =  myHuffmanCode( inSignal , dict )
    
    keys = length (inSignal);
    code = [];
    for i = 1 : keys         %%%%%Testing Testing!!!!  i = 1 : keys
        
        symbol =  strcmp( [dict{:,1}] , inSignal(i) );
        
     %   [numRows,numCols] = size(dict{symbol,2})
        
        code = [ code; (dict{symbol,2})' ];
      
    end


end