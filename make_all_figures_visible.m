function make_all_figures_visible()
    % get handles to all available figures
    h_all = findall(groot, 'type', 'figure');

    % calculate number of handles
    Nh = numel(h_all);

    % loop through figures and make them visible
    for ih = 1:Nh
        % make current figure visible
        set(h_all(ih), 'visible', 'on');
        % add a delay for rendering
        drawnow();
    end
    
end