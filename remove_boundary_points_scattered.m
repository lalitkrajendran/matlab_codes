function [x, y, u, v] = remove_boundary_points_scattered(x, y, u, v, x_pixel_number, y_pixel_number, left_boundary_buffer, right_boundary_buffer, bottom_boundary_buffer, top_boundary_buffer)
% function to remove boundary points from a scattered array of track
% positions
%
% INPUTS:
% x, y: co-ordinates of the tracks (pix.)
% u, v: x and y displacements of the tracks (pix.)
% x_pixel_number, y_pixel_number: number of pixels on the camera sensor
% left_boundary_buffer, right_boundary_buffer, 
% bottom_boundary_buffer, top_boundary_buffer: number of pixels to be
% removed from the respective boundaries
%
% OUTPUTS:
% x, y: co-ordinates of the tracks lying inside the boundary (pix.)
% u, v: x and y displacements of the tracks lying inside the boundary (pix.)
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % if a single buffer value is specified, then set that to be the buffer
    % value for all boundaries
    if nargin < 8
        right_boundary_buffer = left_boundary_buffer;
        top_boundary_buffer = left_boundary_buffer;
        bottom_boundary_buffer = left_boundary_buffer;
    end
    
    % identify points lying between the image boundaries and the buffer
    indices = x < left_boundary_buffer | x > (x_pixel_number - right_boundary_buffer) ...
        | y < bottom_boundary_buffer | y > (y_pixel_number - top_boundary_buffer);
    % remove the identified points
    x(indices) = [];
    y(indices) = [];
    u(indices) = [];
    v(indices) = []; 
end