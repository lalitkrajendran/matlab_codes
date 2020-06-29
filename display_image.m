function display_image(im)
    % display image
    imagesc(im)
    % set colormap
    colormap(gray)
    % set axis to be equal and tight
    set_axes(gca)
    % add axes labels
    annotate_image(gcf, gca)
end