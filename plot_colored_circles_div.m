function plot_colored_circles_div(h, x, y, f, f_min, f_max, r)
% Function to plot circles whose colors are proportional to the value of the quantity
% at that point. The colors are chosen from a diverging colormap.
%
% INPUTS:
% h: handle to the figure
% x, y: co-ordinates of the circle centroids
% f: scalar that controls the color
% f_min, f_max: minimum and maximum value of the scalar
% r: radius of the circle that is to plotted
%
% OUTPUTS:
% NONE
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)    

    % obtain colormap
    cmap = flipud(cbrewer('div', 'RdBu', 100));

    % switch to figure
    figure(h)
    % loop through points and plot circles
    for i = 1:size(x,1)
        % extract current value of the scalar
        current_f = (f(i));
        % calculate color level
        if current_f == f_min
            color_id = 1;
        else
            color_id = ceil((current_f - f_min)/(f_max - f_min) * size(cmap,1));
        end
        % cap the color level
        if color_id <= 1
            color_id = 1;
        elseif isnan(color_id)
            continue
        elseif color_id > size(cmap,1)
            color_id = size(cmap,1);
        end
        
        % extract color for this level
        color_spec = cmap(color_id,:);

        % plot circle
        create_filled_ellipse(x(i), y(i), r, r, color_spec, 10);
        
        % hold on so other circles can be plotted
        if i == 1
            hold on
        end
    end
end