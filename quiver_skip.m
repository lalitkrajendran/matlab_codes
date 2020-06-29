function quiver_skip(h, ax, X, Y, U, V, skip_vector, scale_factor, linewidth)
    set(0, 'currentfigure', h);  %# for figures
    set(h, 'currentaxes', ax);
    % quiver(X(1:(1+skip_vector):end, 1:(1+skip_vector):end), Y(1:(1+skip_vector):end, 1:(1+skip_vector):end), ...
    % U(1:(1+skip_vector):end, 1:(1+skip_vector):end)/scale_factor, V(1:(1+skip_vector):end, 1:(1+skip_vector):end)/scale_factor, 'autoscale', 'off');
    quiver(X(1:(1+skip_vector):end, 1:(1+skip_vector):end), Y(1:(1+skip_vector):end, 1:(1+skip_vector):end), ...
    U(1:(1+skip_vector):end, 1:(1+skip_vector):end) * scale_factor, V(1:(1+skip_vector):end, 1:(1+skip_vector):end) * scale_factor, 'autoscale', 'off', ...
    'linewidth', linewidth);
    
end