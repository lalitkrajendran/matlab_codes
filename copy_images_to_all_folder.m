clear
close all
clc

top_filepath = '/home/shannon/c/aether/Projects/BOS/spark-induced-flow/analysis/data/2018-05-14/';
case_folders = dir(fullfile(top_filepath, '90*'));
for case_index = 1:length(case_folders)
    fprintf('case: %s\n', case_folders(case_index).name);
    % get names of all folders containing images
    folders = dir(fullfile(top_filepath, case_folders(case_index).name, 'test*'));
    num_test_folders = length(folders);
    fprintf('number of test folders: %d\n', num_test_folders);

    % number of reference images
    num_ref_images = 100;

    %% copy images to separate folders

    for i = 1:num_test_folders
        fprintf('test number: %d\n', i);
        test_filepath = fullfile(top_filepath, case_folders(case_index).name, folders(i).name);
        
        % check if the directory contains a folder named 'all' and if not
        % create it
        if ~exist(fullfile(test_filepath, 'all'), 'dir')
            fprintf('creating folder named all\n');
            mkdir(fullfile(test_filepath, 'all'));
            [files, num_files] = get_directory_listing(test_filepath, '*.tif');
            fprintf('moving files to new folder\n');            
            for file_index = 1:num_files
                % name of the file to be copied
                source_filename = fullfile(test_filepath, files(file_index).name);
                % final path to which the file will be copied
                destination_filename = fullfile(test_filepath, 'all', files(file_index).name);
                % copy file
                movefile(source_filename, destination_filename);
            end
            
        end
    end

end