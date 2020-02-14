function [xmin, xmax, ymin, ymax] = extract_displacement_mask_extents(results, display_mask)
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

    % extract mask
    displacement_mask = results.Eval;
    % reshape mask to 2D array
    if size(displacement_mask, 1) == 1 || size(displacement_mask, 2) == 1
        displacement_mask = reshape(displacement_mask, size(results.X, 1), size(results.X, 2));        
    end
    
    % ensure that minimum value of mask is 0
    displacement_mask = displacement_mask - min(displacement_mask(:));
    
    % binarize the mask
    displacement_mask(displacement_mask > 0) = 1;
    
    % identify bounding box for the mask
    stats = regionprops(displacement_mask, 'boundingbox');
    
    % identify extents
    cmin = stats.BoundingBox(1) + 0.5;
    rmin = stats.BoundingBox(2) + 0.5;
    cmax = cmin + stats.BoundingBox(3) - 1;
    rmax = rmin + stats.BoundingBox(4) - 1;
    
    % extract positions corresponding to mask extents
    xmin = results.X(1, cmin);
    xmax = results.X(1, cmax);
    ymin = results.Y(rmin, 1);
    ymax = results.Y(rmax, 1);
    
    % display extents if required
    if display_mask
        figure(100)
        contourf(results.X, results.Y, displacement_mask);
        colormap(gray)
        hold on
        plot(xmin, ymin, 'ro', 'markersize', 14)
        plot(xmax, ymin, 'ro', 'markersize', 14)
        plot(xmax, ymax, 'ro', 'markersize', 14)
        plot(xmin, ymax, 'ro', 'markersize', 14)

        set_axes(gca);
        annotate_image(gcf, gca);
        title('Displacement Mask')
    end
end