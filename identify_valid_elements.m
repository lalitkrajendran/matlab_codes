function [logical_arr, indices] = identify_valid_elements(arr, minval, maxval)
% Function to extract indices of valid elements in an array
%
% INPUTS:
% arr: array whose elements are to be identified
% minval, maxval: desired range
%
% OUTPUTS:
% logical_arr: logical array of the same size as the original with 1 for true, 0 for false
% indices: indices of valid elements
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)
    
    % evaluate logical array (1 for true, 0 for false)
    logical_arr = arr >= minval & arr <= maxval;

    % find indices corresponding to elements in the desired interval
    indices = find(logical_arr);    
end