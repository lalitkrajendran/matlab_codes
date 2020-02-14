function plot_colored_circles_seq(h, x, y, f, min_color, max_color, r, color_class, color_scheme, reverse_colormap)
% Function to plot circles of various colors to represent the magnitude of
% a quantity f using a specified color scheme and color limits.
%
% INPUTS:
% h: figure handle
% x, y: co-ordinates of the centroids of the circles (pix.)
% f: the variable which is to be represented using the colormap
% min_color, max_color: range of values covered by the colormap
% r: radius of each circle
% color_class: 'matlab' or 'cbrewer' or 'colorcet'
% color_scheme: type of color to be used (default = 'Reds'). Refer
% documentation for the cbrewer package or matlab to choose colors.
% reverse_colormap: option to reverse colormap (true/false)
% OUTPUTS:
% NONE.
%
% AUTHORS:
% Lalit Rajendran (lrajendr@purdue.edu)
%
% DATE:
% 2019/09/19
    if nargin < 8
        color_class = 'cbrewer';
        color_scheme = 'Reds';
        reverse_colormap = false;
    end
    
    if strcmp(color_class, 'cbrewer')
        cmap = cbrewer('seq', color_scheme, 100);
    elseif strcmp(color_class, 'matlab')
        cmap = colormap(color_scheme);
    elseif strcmp(color_class, 'colorcet')
        cmap = colorcet(color_scheme, 'N', 100);
    end

    if reverse_colormap
        cmap = flipud(cmap);
    end
    
    figure(h)
    for i = 1:size(x,1)
        current_f = (f(i));
        if current_f == min_color
            color_id = 1;
        else
            color_id = ceil((current_f - min_color)/(max_color - min_color) * size(cmap,1));
        end

        if color_id <= 1
            color_id = 1;
        elseif isnan(color_id)
            continue
        elseif color_id > size(cmap,1)
            color_id = size(cmap,1);
        end

        color_spec = cmap(color_id,:);

        create_filled_ellipse(x(i), y(i), r, r, color_spec, 10);
        if i == 1
            hold on
        end
    end
end