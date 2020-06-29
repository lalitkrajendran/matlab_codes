function convert_images_to_movie(filepath, frame_rate, start_file, stop_file)
% Convert images of density and density gradient fields to a movie and save
% as an avi movie in the folder containing the images
    
    %% load and save images

    % convert density images to movie
    files = dir(fullfile(filepath, '*.png'));
    num_files = length(files);
    fprintf('number of images: %d\n', num_files);

    % get name of parent directory
    [parent_filepath, filename] = fileparts(filepath);

    fprintf('converting images to movie......');
    % outputVideo = VideoWriter(fullfile(filepath, 'movie.avi'));
    % outputVideo = VideoWriter(fullfile(filepath, 'movie.mp4'), 'MPEG-4');
    % outputVideo = VideoWriter(fullfile(parent_filepath, [parent_filepath, '.mp4']), 'MPEG-4');
    % outputVideo = VideoWriter(fullfile(parent_filepath, [filename, '.avi']), 'Motion JPEG AVI');
    % outputVideo = VideoWriter(fullfile(parent_filepath, [filename, '.mp4']), 'MPEG-4');
    outputVideo = VideoWriter(fullfile(parent_filepath, [filename, '.avi']), 'Archival');

    outputVideo.FrameRate = frame_rate;
    open(outputVideo);

    for i = start_file:stop_file
        img = imread(fullfile(filepath, files(i).name));
        writeVideo(outputVideo,img);    
    end

    close(outputVideo);
    fprintf('done.\n');

end