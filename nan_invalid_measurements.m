function [x_valid, valid_indices] = nan_invalid_measurements(x, min_threshold, max_threshold)
% Function to set measurements outside a range to NaN
%
% INPUTS:
% x: array with measurements
% min_threshold, max_threshold: min and max of the valid range of values
%
% OUTPUTS:
% x_valid: array with invalid measurements set to NaN
% valid_indices: indices with valid measurements
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % initialize new array
    s = size(x);
    if numel(s) == 1
        x_valid = nans(s);
    elseif numel(s) == 2        
        x_valid = nans(s(1), s(2));
    elseif numel(s) == 3        
        x_valid = nans(s(1), s(2), s(3));
    end
    
    % find indices with measurements in the range
    valid_indices = find(x >= min_threshold & x <= max_threshold);    
    
    % copy over these measurements
    x_valid(valid_indices) = x(valid_indices);
end