function remove_box_subplots(fig)
% Function to remove box around subplots in a figure
%
% INPUTS:
% fig: handle to figure
%
% OUTPUTS:
% NONE
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % calculate number of subplots
    num_subplots = numel(fig.Children);

    for subplot_index = 1:num_subplots
        fig.Children(subplot_index).Box = 'off';
    end

end