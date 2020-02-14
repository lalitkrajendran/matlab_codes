function save_figure_to_png_eps_fig(figure_save_directory, figure_name, format_id)
% Function to save a figure in the png, eps and fig formats
%
% INPUTS:
% figure_save_directory: directory where the figure is to be saved
% figure_name: file name for the figure
% format_id: three element boolean array to indicate which formats are to
% be saved [png, eps, fig]. by default it saves in all three formats,
% though saving to .eps may take a long time.
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
%         saveas(gcf, fullfile(figure_save_directory, [figure_name '.png']), 'png');
        print(gcf, fullfile(figure_save_directory, [figure_name '.png']), '-dpng', '-r600');
    end
    
    % save to eps
    if format_id(2)
        saveas(gcf, fullfile(figure_save_directory, [figure_name '.eps']), 'epsc');
    end
    
    % save to fig
    if format_id(3)
        saveas(gcf, fullfile(figure_save_directory, [figure_name '.fig']), 'fig');    
    end
        
end