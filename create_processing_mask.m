function mask = create_processing_mask(top_directory, reference_option)

    fprintf('creating processing mask.....');
    top_processing_directory = fullfile(top_directory, 'processing');
    
    % path to directory containing images
    if strcmp(reference_option, 'single')
        image_directory = fullfile(top_processing_directory, 'single-ref');
    elseif strcmp(reference_option, 'average')
        image_directory = fullfile(top_processing_directory, 'average-ref');    
    end
    
    % load a sample image                        
    im = imread(fullfile(image_directory, 'im_0002.tif'));
    
    % create mask array
    mask=ones(size(im,1),size(im,2));
    
    % call roi code
    roiwindow = CROIEditor(im*10);
    while isempty(roiwindow.labels)
        addlistener(roiwindow,'MaskDefined',@your_roi_defined_callback);
        drawnow
    end
    mask(roiwindow.labels==0) = 0;    
end
% 
% function your_roi_defined_callback(h,e)
%     [mask, labels, n] = roiwindow.getROIData;
%     delete(roiwindow);
% end