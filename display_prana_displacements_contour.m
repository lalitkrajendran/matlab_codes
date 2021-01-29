function display_prana_displacements_contour(results, displacement_range, cmap)
% Function to display prana displacements as contours
%
% INPUTS:
% results: results structure from prana processing
% displacement_range: range of displacements to plot (1x2 array)
% cmap: colormap name or array of colors to use
%
% OUTPUTS:
% None
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % account for optional arguments
    if nargin < 2
        displacement_range = [0, 1];
        cmap = 'gray';
    elseif nargin < 3
        cmap = 'gray';
    end

    % calcualte contour levels
    contour_levels = linspace(displacement_range(1), displacement_range(2), 100);
    
    % display figure
    contourf(results.X, results.Y, sqrt(results.U.^2 + results.V.^2), contour_levels, 'edgecolor', 'none')
    % set colormap
    colormap(cmap)
    % adjust axes
    set_axes(gca);
    % annotate axes
    xlabel('X (pix.)')
    ylabel('Y (pix.)')
    % add colorbar
    h = colorbar;
    title(h, 'pix.')
end