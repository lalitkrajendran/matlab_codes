function move_images_to_separate_folders(filepath, num_ref_images)

    %% create folders for reference and grad
    
%     if exist(fullfile(filepath, 'ref'), 'dir')
%         rmdir(fullfile(filepath, 'ref'), 's');
%     end

    mkdir(fullfile(filepath, 'ref'));
    
%     if exist(fullfile(filepath, 'grad'), 'dir')
%         rmdir(fullfile(filepath, 'grad'), 's');
%     end
    
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
    
    if num_files < 1
        fprintf('no files present. exiting function.\n');
        return;
    end
    % copy reference images
    fprintf('moving reference images...... ');
    
    for i = 1:num_ref_images
        % name of the file to be copied
        source_filename = fullfile(img_filepath, files(i).name);
        % final path to which the file will be copied
        destination_filename = fullfile(filepath, 'ref', files(i).name);
        % copy file
        movefile(source_filename, destination_filename);
    end
    fprintf('done.\n');
    
    % copy density gradient images
    fprintf('moving gradient images...... ');
    
    for i = num_ref_images+1:num_files
        % name of the file to be copied
        source_filename = fullfile(img_filepath, files(i).name);
        % final path to which the file will be copied
        destination_filename = fullfile(filepath, 'grad', ['im_' num2str(i - num_ref_images, '%05d') '.tif']);
        % copy file
        movefile(source_filename, destination_filename);
    end
    fprintf('done.\n');

    % move cih file if it existst to the top level folder
    [files, num_files] = get_directory_listing(img_filepath, 'im*.cih');
	if num_files >= 1
        movefile(fullfile(files(1).folder, files(1).name), fullfile(filepath, files(1).name));
    end
    % delete 'all' folder
%     rmdir(img_filepath);
end