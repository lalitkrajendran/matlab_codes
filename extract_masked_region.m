function im2 = extract_masked_region(im, mask)
% function to create a masked version of the image when the mask and the
% image are of different types. especially useful when the masked image is
% to be resaved in its original 
%
% INPUTS:
% im: image array
% mask: mask array
% 
% OUTPUTS:
% im2: image array corresponding to the mask (double)
%
% AUTHORS:
% Lalit Rajendran (lrajendr@purdue.edu)

    % create a copy of the mask array
    mask2 = mask;
    % convert mask to a binary array (from 0s and 255s to 0s and 1s)
    mask2(mask2 > 0) = 1;
    % identify smallest rectangle bounding the masked region 
    stats = regionprops(mask2, 'Boundingbox');
    % extract co-ordinates of the bounding box
    xmin = round(stats.BoundingBox(1));
    ymin = round(stats.BoundingBox(2));
    xmax = xmin + stats.BoundingBox(3) - 1;
    ymax = ymin + stats.BoundingBox(4) - 1;
    % extract masked region from the image
    im2 = im(ymin:ymax, xmin:xmax);
end