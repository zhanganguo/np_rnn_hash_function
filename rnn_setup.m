function rnn = rnn_setup(input_dimension, internal_dimension, output_dimension, f_internal, f_output)

input_weights = randn(internal_dimension, input_dimension);

internal_weights = randn(internal_dimension, internal_dimension);
% internal_weights = internal_weights / max(abs(myeigs(internal_weights,1)));

output_weights = randn(output_dimension, internal_dimension);

rnn.input_weights = input_weights;
rnn.internal_weights = internal_weights;
rnn.output_weights = output_weights;

rnn.internal_states = zeros(internal_dimension, 1);

rnn.internal_activation_function = f_internal;
rnn.output_activation_function = f_output;

rnn.output = [];

end