
function sign =  myHuffmanDeco( code , dict )
    
    size = length ( code );
    sign = [];
    index = []; 
    symbol = [];
    for i=1:size
        
        index = [index , code(i)];
        
        symbol=findByIndex(index,dict);
        
        
 %{
       for y=1 : keys
            value= dict{y,2}
            if isequal(value,index)
                symbol = y
                break;
            end
            
        end
        
        %}
        
        
        
        
        if ~isempty(symbol)       
            sign = [ sign; dict{symbol,1} ];
            index = [];
            symbol = [];
        end
      
    end
    


end






