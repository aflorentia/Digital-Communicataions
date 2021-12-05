function prob = practProp ( xq , centers)
      tabulate(xq);

    v = tabulate(xq);
   % l=length(xq)
   % times = v(:,2);
    prob = v(:,3);
   % [v(:,1) prob];
    prob = prob .* 100;
    
    %{
    alpha = unique (centers(xq))
    [ repeats , alpha ] = hist (centers(xq),alpha)
    prob = repeats ./ length(xq);
    prob=flip(prob)
    %}
    
    
end