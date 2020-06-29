function [xmin, xmax, ymin, ymax] = extract_image_mask_extents(image_mask, display_mask)
% This function extracts the extents of the mask from a displacement field
% obtained from Prana processing
%
% INPUTS:
% results: result strcture obtained from Prana
% display_mask: display the extracted mask and extents? (true/false)
%
% OUTPUTS:
% xmin: left end of mask
% xmax: right end of mask
% ymin: bottom end of mask
% ymax: top end of mask
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    if nargin < 2
        display_mask = 0;
    end
    
    % ensure that minimum value of mask is 0
    image_mask = image_mask - min(image_mask(:));
    
    % binarize the mask
    image_mask(image_mask > 0) = 1;
    
    % identify bounding box for the mask
    stats = regionprops(image_mask, 'boundingbox');
    
    % identify extents
    cmin = stats.BoundingBox(1) + 0.5;
    rmin = stats.BoundingBox(2) + 0.5;
    cmax = cmin + stats.BoundingBox(3) - 1;
    rmax = rmin + stats.BoundingBox(4) - 1;
    
    % extract positions corresponding to mask extents
    xmin = cmin;
    xmax = cmax;
    ymin = rmin;
    ymax = rmax;
    
    % display extents if required
    if display_mask
        figure(100)
        imagesc(image_mask);
        colormap(gray)
        hold on
        plot(xmin, ymin, 'ro', 'markersize', 14)
        plot(xmax, ymin, 'ro', 'markersize', 14)
        plot(xmax, ymax, 'ro', 'markersize', 14)
        plot(xmin, ymax, 'ro', 'markersize', 14)
        set_axes(gca);
        annotate_image(gcf, gca);
        title('Mask')
    end
end