function save_figure_to_png_svg_fig(figure_save_directory, figure_name, format_id)
% Function to save a figure in the png, svg and fig formats
%
% INPUTS:
% figure_save_directory: directory where the figure is to be saved
% figure_name: file name for the figure
% format_id: three element boolean array to indicate which formats are to
% be saved [png, svg, fig]. by default it saves in all three formats.
% 
%
% OUTPUTS:
% NONE
%
% AUTHORS:
% Lalit Rajendran (lrajendr@purdue.edu)

    if nargin < 3
        format_id = [true, true, true];
    end
    
    % save to png
    if format_id(1)
        % saveas(gcf, fullfile(figure_save_directory, [figure_name '.png']), 'png');
        % print(gcf, fullfile(figure_save_directory, [figure_name '.png']), '-dpng', '-r600');
        export_fig(fullfile(figure_save_directory, [figure_name '.png']), '-r600');
    end
    
    % save to eps
    if format_id(2)
        export_fig(fullfile(figure_save_directory, [figure_name '.svg']));
        % fig2svg(fullfile(figure_save_directory, [figure_name '.svg']));
        % saveas(gcf, fullfile(figure_save_directory, [figure_name '.eps']), 'epsc');
    end
    
    % save to fig
    if format_id(3)
        saveas(gcf, fullfile(figure_save_directory, [figure_name '.fig']), 'fig');    
    end
        
end