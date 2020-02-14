function plot_colored_circles_div(h, x, y, f, min_color, max_color, r)
    
    cmap = flipud(cbrewer('div', 'RdBu', 100));

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