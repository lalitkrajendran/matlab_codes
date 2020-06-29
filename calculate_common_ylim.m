function y_lim = calculate_common_ylim(fig)
% Function to calculate common y limits for all axes
%
% INPUTS:
% fig: handle to the figure
%
% OUTPUTS:
% y_lim: common y limits. [ymin, ymax]
%
% AUTHORS:
% Lalit Rajendran (lrajendr@purdue.edu)
% 
% DATE:
% 2020/06/05

    % calculate number of subplots
    num_subplots = numel(fig.Children);

    % allocate memory to hold y limits
    y_lim_all = nans(num_subplots, 2);

    % loop through sub plots and extract y limits
    for subplot_index = 1:num_subplots
        y_lim_all(subplot_index, :) = fig.Children(subplot_index).YLim;
    end

    % calculate max and min limits
    y_lim = [0.9 * min(y_lim_all(:, 1)), 1.1 * max(y_lim_all(:, 2))];
end