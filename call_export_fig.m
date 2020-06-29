function call_export_fig(h, ax, filename, user_screen_resolution)
    pos = get(h, 'position');
    set(h, 'units', 'inches', 'Position', pos/user_screen_resolution);
    % set(ax, 'units', 'pixels', 'fontsize', 11);
    export_fig(h, filename, '-r600');
end