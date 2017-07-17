function out = f(activation, type)

    if strcmp(type,'linear') == 1
        out = activation;
    elseif strcmp(type, 'sigmod') == 1
        out = 1 ./ (1 + exp(activation));
    elseif strcmp(type, 'tanh') == 1
        out = (1 - exp(activation)) ./ (1 + exp(activation));
    elseif strcmp(type, 'relu') == 1
        out = max(0, activation);
    end

end