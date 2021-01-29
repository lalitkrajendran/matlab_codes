function indices = identify_nan_elements(varargin)
% Function to identify all nan elements across variables
%
% INPUTS:
% varargin: variables where nan elements are to be identified
%
% OUTPUTS:
% indices: indices where any one of the variables are NaN
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % create array to hold all elements
    arr = convert_cell_array_to_matrix(varargin);
    % arr = cell2mat(varargin(:, :)');

    % identify indices containing nan elements
    indices = any(isnan(arr), 2);
end