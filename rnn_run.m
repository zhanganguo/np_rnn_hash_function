function rnn = rnn_run(rnn, input)

for i = 1 : size(input, 2)
    rnn.internal_states = f(rnn.internal_weights * rnn.internal_states + rnn.input_weights * input(:, i), rnn.internal_activation_function);
    
    rnn.output = f(rnn.output_weights * rnn.internal_states, rnn.output_activation_function);
end

% figure, plot(rnn.output, 'r');
% title('rnn.output');
% grid;

end