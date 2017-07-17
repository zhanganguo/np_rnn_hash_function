function hash_code = hash(password, rnn, k)

target_code = nonlinear_preprocess(password);

rnn = rnn_run(rnn, target_code);

rnn.output = fix(rnn.output * 10^(k+1));
out = cell(size(rnn.output_weights, 1), 1);
output_value = cell(size(rnn.output_weights, 1), k);
for i = 1 : size(rnn.output_weights, 1)
    v = rnn.output(i);
    out{i} = dec2hex(abs(v), 8);
    for j = 1 : k
        output_value{i, j} = out{i}(end-k+j);
    end
end

hash_code = [];
for i = 1 : size(rnn.output_weights, 1)
    for j = 1 : k
        hash_code = [hash_code output_value(i, j)];
    end
end

end