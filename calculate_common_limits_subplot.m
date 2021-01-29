function [x_lim, y_lim] = calculate_common_limits_subplot(fig)
% Function to calculate common limits for all axes in a subplot
%
% INPUTS:
% fig: handle to the figure
% or subplots: handles to the subplot axes
%
% OUTPUTS:
% x_lim, y_lim: common limits. 
%
% AUTHORS:
% Lalit Rajendran (lrajendr@purdue.edu)

    if strcmpi(get(fig, 'type'), 'figure')
        [subplots, num_subplots] = extract_subplots(fig);
    else
        subplots = fig;
        num_subplots = numel(subplots);
    end

    % allocate memory to hold y limits
    x_lim_all = nans(num_subplots, 2);
    y_lim_all = nans(num_subplots, 2);

    % loop through sub plots and extract y limits
    for subplot_index = 1:num_subplots
        x_lim_all(subplot_index, :) = subplots(subplot_index).XLim;
        y_lim_all(subplot_index, :) = subplots(subplot_index).YLim;
    end

    % calculate max and min limits
    x_lim = [0.9 * min(x_lim_all(:, 1)), 1.1 * max(x_lim_all(:, 2))];
    y_lim = [0.9 * min(y_lim_all(:, 1)), 1.1 * max(y_lim_all(:, 2))];
    
end