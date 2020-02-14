function figure_handle = convert_figure_to_presentation_mode(figure_handle)
    % set line width
    linewidth = 2;
    % set font size
    fontsize = 14;
    % set font_weight
    fontweight = 'bold';
    % adjust figure properties
    figure_handle = adjust_figure_properties(figure_handle, linewidth, fontsize, fontweight);

end

function figure_handle = adjust_figure_properties(figure_handle, linewidth, fontsize, fontweight)
% This function adjusts the figure properties based on the inputs.

% INPUTS:
% figure_handle: Object storing the figure properties. Obtained by calling gcf.
% linewidth: width of all the lines in the figure (including the axes)
% fontsize: font size of the text in the figure including the legend
% fontweight: specifies whether the text should be 'normal' or 'bold'

% OUTPUTS:
% figure_handle: modified figure handle
% axes_handle: modified axes handle

% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)
    
    % get the axes handle
    axes_handle = figure_handle.CurrentAxes;
    
    % adjust line width
    line = findobj(gcf, 'type', 'line');
    set(line, 'linewidth', linewidth);
    % adjust font size
    set(axes_handle, 'fontsize', fontsize);
    % adjust font weight
    set(axes_handle, 'fontweight', fontweight);
    % adjust axes linewidth
    set(axes_handle, 'linewidth', linewidth);
    
    % update axes handle
    figure_handle.CurrentAxes = axes_handle;

end