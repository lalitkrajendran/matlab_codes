function [data, num_files] = load_directory_data(filepath, search_string)
% This function loads the contents of .mat files from a directory obeying a
% naming format specified by the search string e.g. *pass*.mat

	% get directory listing
    [files, num_files] = get_directory_listing(filepath, search_string);
    
    % initialize data structure
    data = cell(1, num_files);

    % load data
    for file_index = 1:num_files
        data{file_index} = load(fullfile(filepath, files(file_index).name));
    end
    
end