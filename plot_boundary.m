function plot_boundary(X, Y, boundaries)
% Function to plot elements on a boundary
%
% INPUTS:
% X, Y: co-ordinate matrices
% boundaries: cell array of boundaries with list of points. output of bwboundaries.
%
% OUTPUTS:
% None
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)
    
    % loop through all boundaries    
    for boundary_index = 1:length(boundaries)
        % extract points on current boundary
        current_boundary = boundaries{boundary_index};
        % number of elements in the current boundary
        num_elements = size(current_boundary,1);
        
        % intialize co-ordinates of boundary points
        x = zeros(num_elements, 1);
        y = zeros(num_elements, 1);

        % extract co-ordinates of boundary points
        for i = 1:num_elements
            x(i) = X(current_boundary(i,1), current_boundary(i,2));
            y(i) = Y(current_boundary(i,1), current_boundary(i,2));
        end
        % plot boundary points
        plot(x, y, 'r', 'linewidth', 2.0)        
        hold on
    end

end