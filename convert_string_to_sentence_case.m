function str_new = convert_string_to_sentence_case(str)
% This function converts a string to sentence case (first letter is upper
% case). 
%
% INPUT:
% str: string with each word separated by a space
%
% OUTPUT:
% str_new: update string in sentence case
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % split string
    str_split = strsplit(str, ' ');
    str_split_new = cell(size(str_split));
    % loop through strings and convert first character to upper case
    for sub_str_index = 1:numel(str_split)
        % extract substring
        sub_str = str_split{sub_str_index};
        % replace first character
        sub_str_new = [upper(sub_str(1)) sub_str(2:end)];
        % update 
        str_split_new{sub_str_index} = sub_str_new;
    end
    % join string
    str_new = strjoin(str_split_new);
end