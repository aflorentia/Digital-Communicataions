function  [cell,meanEncoLengthA]  = myHuffmanDict( alphabet , prob )
    
    keys = 1:numel(alphabet);
    
    G=digraph();
    G = addnode(G,alphabet);
    G.Nodes.Value = prob';
    
   % figure;
    %plot(G)
    
    [ tempProp, order ] = sort(prob,2,'descend')
    G = reordernodes(G,order);
    
    %figure;
    %plot(G)
%    figure;
 %   h=plot(G);
  %  layout(h,'layered','Direction','right','Sources',alphabet)
    
    i = numnodes ( G );
    r=0;
    
    while i>1
        sum = G.Nodes.Value(i) + G.Nodes.Value(i-1);
        kappa=strjoin(G.Nodes.Name(i-1:i)) ;
        
        G = addedge( G , [ G.Nodes.Name(i)  G.Nodes.Name(i-1)], ( kappa  ) , [1 0])   ;        %%%%% [ kappa ]
        newN = findnode(G,kappa);
        G.Nodes.Value(newN)=sum;
        
  %      figure;
   %     plot(G,'EdgeLabel',G.Edges.Weight);
   
     %   figure;
      %  h=plot(G,'EdgeLabel',G.Edges.Weight);
       % layout(h,'layered','Direction','right','Sources',alphabet);
        
        tempProp=[tempProp, sum ];
        [ tempProp , order ] = sort(tempProp,2,'descend');
        G = reordernodes(G,order);
        
        r=r+2;
        i=numnodes ( G ) - r;
    end
    
    for i=keys
        symbol = findnode(G,alphabet(i));
        [ T ,E ] = dfsearch(G , G.Nodes.Name(symbol),'edgetonew');
        result = flip(G.Edges.Weight(E))';
        cell(i,:) = { alphabet(i),result};
    end
    
    figure;
    h=plot(G,'EdgeLabel',G.Edges.Weight);
    layout(h,'layered','Direction','right','Sources',alphabet) 
    
    %% Υπολογισμός μέσου μήκους κώδικα
    meanEncoLengthA = 0;
    for h = 1 : length ( prob )
        meanEncoLengthA = meanEncoLengthA+ prob(h)*length(cell2mat(cell(h,2)));
    end
    
end