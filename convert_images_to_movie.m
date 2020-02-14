function convert_images_to_movie(filepath, frame_rate, num_files_max)
% Convert images of density and density gradient fields to a movie and save
% as an avi movie in the folder containing the images
    
    if nargin < 3
        num_files_max = realmax('double');
    end
    %% load and save images

    % convert density images to movie
    files = dir(fullfile(filepath, '*.png'));
    num_files = length(files);
    fprintf('number of images: %d\n', num_files);
    if num_files > num_files_max
        num_files = num_files_max;
    end

    fprintf('converting images to movie......');
%     outputVideo = VideoWriter(fullfile(filepath, 'movie.avi'));
    outputVideo = VideoWriter(fullfile(filepath, 'movie.mp4'), 'MPEG-4');
    outputVideo.FrameRate = frame_rate;
    open(outputVideo);

    for i = 1:num_files
        img = imread(fullfile(filepath, files(i).name));
        writeVideo(outputVideo,img);    
    end

    close(outputVideo);
    fprintf('done.\n');

end