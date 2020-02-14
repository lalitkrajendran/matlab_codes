function h = display_nrrd_file(filename)

    % load data
    [data, meta_data] = nrrdread(filename);

    % extract 2D slice of the density field (kg/m^3)
    rho = data(:, :, 1);

    % extract number of grid points along x, y and z
    str = strsplit(meta_data.sizes, ' ');
    nx = str2double(str{1});
    ny = str2double(str{2});
    nz = str2double(str{3});

    % extract grid spacing along x, y and z (mm)
    str = strsplit(meta_data.spacings, ' ');
    dx = str2double(str{1}) * 1e-3;
    dy = str2double(str{2}) * 1e-3;
    dz = str2double(str{3}) * 1e-3;

    % extract origin along x, y and z (mm)
    str = strsplit(meta_data.spaceorigin(2:end-1), ',');
    x0 = str2double(str{1}) * 1e-3;
    y0 = str2double(str{2}) * 1e-3;
    z0 = str2double(str{3}) * 1e-3;

    % create co-ordinate arrays (um)
    x = x0 + (0:nx-1) * dx;
    y = y0 + (0:ny-1) * dy;
    z = z0 + (0:nz-1) * dz;

    % create 2D co-ordinate grid
    [X, Y] = meshgrid(x, y);

    %% display density field

    contour_levels = linspace(min(rho(:)), max(rho(:)), 100); 
    h = figure;
    contourf(X, Y, data(:, :, 1), contour_levels, 'edgecolor', 'none')
    ch = colorbar;
    axis equal
    axis tight
    xlabel('X (mm)')
    ylabel('Y (mm)')
    title(ch, '\rho (kg/m^3)')
    set(gcf, 'Position', [360   587   437   313])
end



