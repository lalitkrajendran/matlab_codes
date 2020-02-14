function save_figure_to_file(figure_handle, figure_save_filepath, figure_name, figure_save_mode)

% This function saves a figure to file in .fig, .eps and .png formats.

% INPUTS:
% figure_handle: Object storing the figure properties. Obtained by calling gcf.
% figure_save_filepath: Path to the folder where the figure will be saved
% figure_name: The name under which the figure will be saved
% figure_save_mode: Export format. Can be 'document' or 'presentation'

% OUTPUTS:
% This function does not return any output

% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)
    
    % adding this for backwards compatibility
    if nargin < 4
        figure_save_mode = 'none';
    end
    
    % set line width
    linewidth = 2;
    % set font size
    fontsize = 14;
    if strcmp(figure_save_mode, 'document')
        %%=========== save figure in document mode ======================%%
        % font
%         fontname='Times';
        fontname='helvetica';
        % set font_weight
        fontweight = 'normal';
        % adjust figure properties
        figure_handle = adjust_figure_properties(figure_handle, linewidth, fontname, fontsize, fontweight);
    elseif strcmp(figure_save_mode, 'presentation')
        %%========== save figure in presentation mode ===================%%
        % set line width
        linewidth = 2;
        % font
        fontname='helvetica';
        % set font_weight
        fontweight = 'bold';
        % adjust figure properties
        figure_handle = adjust_figure_properties(figure_handle, linewidth, fontname, fontsize, fontweight);
    end
        
    savefig(figure_handle, fullfile(figure_save_filepath, [figure_name '.fig']));
    print(figure_handle, fullfile(figure_save_filepath, [figure_name '.eps']), '-depsc');
    print(figure_handle, fullfile(figure_save_filepath, [figure_name '.png']), '-dpng');

end

function figure_handle = adjust_figure_properties(figure_handle, linewidth, fontname, fontsize, fontweight)
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
    
    % get all the axes handles in the figure
    all_axes_handles = findall(figure_handle,'type','axes');
    
    % adjust properties for all axes
    for axes_index = 1:length(all_axes_handles)
        
        axes_handle = all_axes_handles(axes_index);

        % adjust line width
        line = findobj(gcf, 'type', 'line');
        set(line, 'linewidth', linewidth);
        % adjust font name
        set(axes_handle, 'fontsize', fontsize);        
        % adjust font size
        set(axes_handle, 'fontname', fontname);
        % adjust font weight
        set(axes_handle, 'fontweight', fontweight);
        % adjust axes linewidth
        set(axes_handle, 'linewidth', linewidth);

%         % update axes handle
%         figure_handle.CurrentAxes = axes_handle;
    
    end

end