function target_code = nonlinear_preprocess(password)

target_code = zeros(8, length(password));

for i = 1 : length(password)
    character = password(i);
    ascii_code = dec2bin(abs(character));
    ascii_code = strcat('0', ascii_code);
    for j = 1 : 8
        ascii_code = circshift(ascii_code, [0, -1]);
        shifted_value = bin2dec(ascii_code);
        normalized_value = shifted_value / 255;
        target_code(j, i) = normalized_value;
    end
end

end