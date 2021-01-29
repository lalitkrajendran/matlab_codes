function set_subplots_position_y(fig, pos_min, height)
% Function to set all subplots in a figure to be the same custom height
%
% INPUTS:
% fig: handle to the figure
% pos_min: y co-ordinate
% height: figure height 
%
% OUTPUTS:
% NONE
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % get axes
    allaxes = findall(fig, 'type', 'axes');
    num_axes = numel(allaxes);

    % loop through axes and adjust height
    for ax_index = 1:num_axes
        % get position
        pos = get(allaxes(ax_index), 'position');
        % set minimum height
        pos(2) = pos_min;
        % set height
        pos(4) = height;
        % update position
        set(allaxes(ax_index), 'position', pos);
    end
end