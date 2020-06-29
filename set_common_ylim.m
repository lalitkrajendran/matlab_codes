function set_common_ylim(fig, lim_mode, y_lim)
% Function to set common y limits for all axes
%
% INPUTS:
% fig: handle to the figure
% lim_mode: 'auto' to calculate y limits, 'manual' to force it
% y_lim: limits to use in the manual mode
%
% OUTPUTS:
% None
%
% AUTHORS:
% Lalit Rajendran (lrajendr@purdue.edu)
% 
% DATE:
% 2020/06/05

    % check if all inputs have been provided
    if nargin < 3
        if strcmp(lim_mode, 'auto')
            y_lim = [0 0];
        else
            fprintf('Error. Must supply y_lim in manual mode\n');
            return;
        end
    end
    
    % calculate number of subplots
    num_subplots = numel(fig.Children);

    % calculate y limit if mode is auto
    if strcmp(lim_mode, 'auto')
        y_lim = calculate_common_ylim(fig);
    end
    
    % loop through sub plots and set y limits
    for subplot_index = 1:num_subplots
        fig.Children(subplot_index).YLim = y_lim;
    end

end