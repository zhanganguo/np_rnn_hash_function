function hash_code = hash(password, rnn, k)

target_code = nonlinear_preprocess(password);

rnn = rnn_run(rnn, target_code);

rnn.output = fix(rnn.output * 10^(k+1));
out = dec2hex(abs(int(rnn.output)));
output_value = zeros(size(rnn.output_weights, 1), k);
for i = 1 : k
    output_value(:, i) = out(:,end-k+1);
end
hash_code = [];
for i = 1 : length(output_value_1)
    for j = 1 : k
        hash_code = [hash_code output_value(i, k)];
    end
end

end