dbstop if error

TRIALS = 1;
trial_differences = zeros(TRIALS, 3);

for trial = 1 : TRIALS
    fprintf('current in trial: %d\n', trial);
    %% setup the Recurrent Neural Network
    rnn = rnn_setup(8, 200, 64, 'tanh', 'linear');
    % load('rnn.mat');
    
    %% hash process
    rnn = rnn_initialize(rnn);
    password1 = '1b2FC1Pe6B94aZbD4740D7kd9L9B844f9g';
    hash_code_1 = hash(password1, rnn, 2);
    
    rnn = rnn_initialize(rnn);
    password2 = '2b2FC1Pe6B94aZbD4740D7kd9L9B844f9g';
    hash_code_2 = hash(password2, rnn, 2);
    
    rnn = rnn_initialize(rnn);
    password3 = '1b2FC1Pe6B94aZbD4840D7kd9L9B844f9g';
    hash_code_3 = hash(password3, rnn, 2);
    
    rnn = rnn_initialize(rnn);
    password4 = '1b2FC1Pe6B94aZbD4740D7kd9L9B844f9h';
    hash_code_4 = hash(password4, rnn, 2);
    
    hash_codes = [hash_code_1; hash_code_2; hash_code_3; hash_code_4];
    
    %% utilize the results
    hash_bin = cell(size(hash_codes, 1), 1);
    code = cell(size(hash_codes, 1), 1);
    for i = 1 : size(hash_codes, 1)
        hash_bin{i} = dec2bin(hash_codes(i, :), 4);
        hash_bin{i} = reshape(hash_bin{i}', 1, size(hash_bin{i}, 1) * size(hash_bin{i}, 2));
        for k = 1 : length(hash_bin{i})
            code{i} = [code{i} str2num(hash_bin{i}(k))];
        end
        figure;stairs(code{i});
    end

    %% Sensibility
    differences = zeros(size(hash_codes, 1) - 1, 1);
    for i = 1 : size(hash_codes, 1) - 1
        differences(i) = length(find(code{1} ~= code{i+1}));
        trial_differences(trial, i) = differences(i);
    end
    
    %% Information Entropy
    entropy = zeros(size(hash_codes, 1), 1);
    for k = 1 : size(hash_codes, 1)
        values = unique(hash_codes());
        percents = zeros(length(values), 1);
        for i = 1 : length(values)
            percents(i) = length(find(hash_codes(k,:) == values(i))) / length(hash_codes(k, :));
            entropy(k) = entropy(k) - percents(i) * log2(percents(i));
        end
    end
    
end


