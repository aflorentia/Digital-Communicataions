function [ SecOrderAlpha , secOrderProp ] = SecondOrderExpansion ( alphabet , prop )
    keys = length ( alphabet );
    SecOrderAlpha = [];
    secOrderProp = []; 
    for i = 1 : keys
        for j = 1 : keys
            tempA = alphabet (i) + alphabet (j);
            SecOrderAlpha = [ SecOrderAlpha , tempA ];

            tempP = prop(i)*prop(j);
            secOrderProp = [ secOrderProp , tempP ];
        end
    end
end