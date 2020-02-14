function copy_images_to_separate_folders(filepath, num_ref_images)

    %% create folders for reference and grad
    
    if exist(fullfile(filepath, 'ref'), 'dir')
        rmdir(fullfile(filepath, 'ref'), 's');
    end

    mkdir(fullfile(filepath, 'ref'));
    
    if exist(fullfile(filepath, 'grad'), 'dir')
        rmdir(fullfile(filepath, 'grad'), 's');
    end
    
    mkdir(fullfile(filepath, 'grad'));
    
    % directory containing all the images
    img_filepath = fullfile(filepath, 'all');
    
    if ~exist(img_filepath, 'dir')
        fprintf('directory does not exist. exiting function.\n');
        return;
    end
    %% copy first half of the images to reference numbering them correctly
    % load list of images
    files = dir(fullfile(img_filepath, 'im*.tif'));
    num_files = length(files);
    fprintf('number of files: %d\n', num_files);
    
    % copy reference images
    fprintf('copying reference images...... ');
    
    for i = 1:num_ref_images
        % name of the file to be copied
        source_filename = fullfile(img_filepath, files(i).name);
        % final path to which the file will be copied
        destination_filename = fullfile(filepath, 'ref', files(i).name);
        % copy file
        copyfile(source_filename, destination_filename);
    end
    fprintf('done.\n');
    
    % copy density gradient images
    fprintf('copying gradient images...... ');
    
    for i = num_ref_images+1:num_files
        % name of the file to be copied
        source_filename = fullfile(img_filepath, files(i).name);
        % final path to which the file will be copied
        destination_filename = fullfile(filepath, 'grad', ['img' num2str(i - num_ref_images, '%03d') '.tif']);
        % copy file
        copyfile(source_filename, destination_filename);
    end
    fprintf('done.\n');

end