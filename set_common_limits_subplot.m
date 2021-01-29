function set_common_limits_subplot(fig, lim_type, lim_mode, ax_lim)
% Function to set common x and y limits for all axes
%
% INPUTS:
% fig: handle to the figure
% lim_type: limits that are to be changed ('x', 'y')
% lim_mode: 'auto' to calculate imits, 'manual' to force it
% ax_lim: limits to use in the manual mode [min max]
%
% OUTPUTS:
% None
%
% AUTHORS:
% Lalit Rajendran (lrajendr@purdue.edu)

    % check if all inputs have been provided
    if nargin < 4 && ~strcmp(lim_mode, 'auto')
        fprintf('Error. Must supply limits in manual mode\n');
        return;
    end
    
    % extract subplots
    [subplots, num_subplots] = extract_subplots(fig);

    % calculate y limit if mode is auto
    if strcmp(lim_mode, 'auto')
        % y_lim = calculate_common_ylim(fig);
        [x_lim, y_lim] = calculate_common_limits_subplot(subplots);
        if strcmp(lim_type, 'x')
            ax_lim = x_lim;
        else
            ax_lim = y_lim;
        end
    end
    

    % loop through sub plots and set y limits
    for subplot_index = 1:num_subplots        
        if strcmp(lim_type, 'x')
            subplots(subplot_index).XLim = ax_lim;
        else
            subplots(subplot_index).YLim = ax_lim;
        end
    end
end