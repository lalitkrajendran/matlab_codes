function top_processing_directory = create_processing_directory(top_directory, reference_option, num_images, background_subtraction, im_bg_d)
    % This function creates a processing directory for BOS experiments with a
    % grad and reference folders to store the images with and without the
    % density gradients respectively.
    % For all the final images, the reference image is the same. However that
    % image can be an average of all the reference images or just a single
    % snapshot, and this is specifed using the reference_option.

    % clear
    % close all
    % clc
    
    if nargin < 3
        num_images = 0;
        background_subtraction = false;
    end
    
    %%

    % create processing folder
    fprintf('creating processing folders.....');
    top_processing_directory = fullfile(top_directory, 'processing');
    if ~exist(top_processing_directory, 'dir')
        mkdir(top_processing_directory);
    end

    if strcmp(reference_option, 'single')
        single_reference_directory = fullfile(top_processing_directory, 'single-ref');
        if ~exist(single_reference_directory, 'dir')
            mkdir(single_reference_directory);
            mkdir(fullfile(top_processing_directory, 'vectors-single-reference'));
        end

    elseif strcmp(reference_option, 'average')
        average_reference_directory = fullfile(top_processing_directory, 'average-ref');    
        if exist(average_reference_directory, 'dir')
            rmdir(average_reference_directory, 's');
        end

        mkdir(average_reference_directory);
%         mkdir(fullfile(top_processing_directory, 'vectors-average-reference'));
    else
        fprintf('Invalid Input\n');
        keyboard;
    end
    fprintf('done.\n');    

    %% create a common reference image (single or average)
    fprintf('create a common reference image.....');

    reference_directory = fullfile(top_directory, 'ref');

    % load filenames in reference directory
    [reference_files, num_reference_files] = get_directory_listing(reference_directory, 'im*.tif');
    
    if isempty(reference_files)
        fprintf('no reference images. exiting function.\n');
        return;
    end

    if strcmp(reference_option, 'single')
        %%%%%%%%%%%%%%% single reference %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        % load image
        im = imread(fullfile(reference_directory, reference_files(1).name));

        % set this as reference
        im_ref_d = double(im);
        
    elseif strcmp(reference_option, 'average')
        %%%%%%%%%%%%%%% average reference %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        % loop over all files to calculate the reference
        for file_index = 1:num_reference_files
            % form image filename
            im_filename = fullfile(reference_files(file_index).folder, reference_files(file_index).name);
            % load image
            im = imread(im_filename);
            % converge image to double array for averaging
            im_d = double(im);

            % if this is the first iteration, create an array that
            % will store the sum of all the images that are read
            if file_index==1
                sum = zeros(size(im_d));
            end

            % add image to the sum array
            sum = sum + im_d;
        end

        % caculate average image
        im_ref_d = sum/num_reference_files;
        
    else
        % wrong option entered, exit program
        fprintf('wrong reference option entered');
        return;
    end

    % perfrom background subtraction
    if background_subtraction
        im_ref_d = im_ref_d - im_bg_d;
        im_ref_d(im_ref_d < 0) = 0;
    end
    
    % set this image as the reference
    im_ref = cast(im_ref_d, class(im));

    fprintf('done.\n');
        
    %% copy grad and reference image alternately
    fprintf('copying grad and reference images alternately.....');
    
    % calculate number of images in the directory with density gradient
    grad_directory = fullfile(top_directory, 'grad');
    % load filenames in reference directory
    [grad_files, num_grad_files] = get_directory_listing(grad_directory, 'im*.tif');
    % calculate total number of images to be copied to the processing directory
    num_images_total = 2 * num_grad_files;

    % copy only a small portion of the images if required
    if num_images ~=0 && num_images < num_images_total
        num_images_total = num_images;
    end
    % copy reference and gradient images alternately
    for file_index = 1:num_images_total    
        % destination filepath
        if strcmp(reference_option, 'single')
            destination_directory = single_reference_directory;
        else
            destination_directory = average_reference_directory;
        end
        % destination filename
        destination_filename = fullfile(destination_directory, ['im_' num2str(file_index, '%04d') '.tif']);

        %%%%%%%%%%%%%%%%% gradient image %%%%%%%%%%%%%%%%%%%%%%%%
        if rem(file_index,2) ~=0
            % calculate the index of the gradient file to copy
            grad_file_index = floor(file_index/2) + rem(file_index,2);

            % name of the gradient file to be copied
            grad_filename = grad_files(grad_file_index).name;

            % source filepath and filename
            source_filename = fullfile(grad_directory, grad_filename);

            % load file and perform background subtraction
            im_grad = imread(source_filename);
            if background_subtraction
                im_grad_d = double(im_grad) - im_bg_d;
                im_grad_d(im_grad_d < 0) = 0;
                im_grad = cast(im_grad_d, class(im_grad));
            end
            
            % copy file
            imwrite(im_grad, destination_filename);
        %%%%%%%%%%%%%%%%% reference image %%%%%%%%%%%%%%%%%%%%%%%%
        else                        
            % save image in destination
            imwrite(im_ref, destination_filename);
        end
    end
    
    fprintf('done.\n');
end