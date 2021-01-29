function set_subplots_height(fig, height)
% Function to set all subplots in a figure to be the same custom height
%
% INPUTS:
% fig: handle to the figure
% height: normalized height
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
        % set height
        pos(4) = height;
        % update position
        set(allaxes(ax_index), 'position', pos);
    end
end