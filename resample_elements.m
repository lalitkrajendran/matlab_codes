function varargout = resample_elements(varargin)
% Function to resample elements from a set of variables
%
% INPUTS:
% varargin: variable arrays to resample. the last element needs to be number of elements
% to resample
%
% OUTPUTS:
% varargout: resampled variable arrays
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % number of variables
    num_var = numel(varargin);

    % number of elements to be resampled
    num_resample = varargin{end};
    
    % create array from elements
    arr = convert_cell_array_to_matrix(varargin(1:num_var-1));

    % randomly sample elements
    arr_s = datasample(arr, num_resample);

    % copy elements back to cell
    varargout = convert_matrix_to_cell_array(arr_s);

end