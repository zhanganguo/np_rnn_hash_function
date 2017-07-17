characters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', ...
    'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', ...
    'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', ...
    'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', ...
    'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', ...
    'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', ...
    '8', '9'};

%% =================
% target_codes = zeros(length(characters), 8);
% distances = cell(length(passwords), 1);
%
% for i = 1 : length(characters)
    %     item_dist = zeros(length(passwords), 1);
    %     similarity = zeros(length(passwords), 1);
%     t_c = nonlinear_preprocess(characters{i});
    % %     figure, plot(t_c), title(passwords{i});
    %     for j = 1 : length(passwords)
    %         t_c_cmp = nonlinear_preprocess(passwords{j});
    %         item_dist(j) = dist(t_c', t_c_cmp);
    %         similarity(j) = t_c'*t_c_cmp / (norm(t_c) * norm(t_c_cmp));
    %     end
    %
    %     similarity(i) = [];
    %     figure, plot(similarity), title(passwords{i});
    %
    %     item_dist(item_dist == 0) = [];
    %     distances{i} = item_dist;
    % %     figure, plot(distances{i}), title(passwords{i});
%     target_codes(i,:) = t_c;
% end

%% ======================
% ascii_codes = zeros(length(characters), 1);
% for i = 1 : length(characters)
%     ascii_codes(i) = abs(characters{i});
% end
% figure;scatter(1:length(ascii_codes'), ascii_codes');title('ascii code');
% for i = 1 : 8
%     figure;scatter(1:length(target_codes(:,i)), target_codes(:,i));
%     %     title(strcat('target input :', num2str(i)));
%     ylabel('Öµ', 'FontSize', 14, 'FontName', 'Î¢ÈíÑÅºÚ');
%     ylim([0, 1]);
%     xlabel('×Ö·û', 'FontSize', 14, 'FontName', 'Î¢ÈíÑÅºÚ');
%     xlim([0, 65]);
%     set(gca, 'XTick', [1, 26, 27, 52, 53, 62]);
%     set(gca, 'XTickLabel', {'a', 'z', 'A', 'Z', '0', '9'});
%     set(gca, 'FontSize', 14);
% end

%% ====================== Collision Test ===========================
rnn = rnn_setup(8, 200, 64, 'tanh', 'linear');
password = '1b2FC1Pe6B94aZbD4740D7kd9L9B844f9g';

rnn = rnn_initialize(rnn);
hash_code = hash(password, rnn);

TRIALS = 1000;
differences = zeros(TRIALS, 1);
for i = 1 : TRIALS
    pwd_index = max(1, fix(rand(1) * length(password)));
    char_index = max(1, fix(rand(1) * length(characters)));
    password(pwd_index) = characters{char_index};
    rnn = rnn_initialize(rnn);
    hash_code_2 = hash(password, rnn);
    differences(i) = sum(abs(hash_code - hash_code_2));
end