function varargout = remove_indices_from_array(varargin)
% Function to remove a set of elements from multiple arrays.
%
% INPUTS:
% varargin: arrays whose elements are to be removed. the last 
%          variable should be the set of indices to be removed
%
% OUTPUTS:
% varargout: the input arrays with the elements removed
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % indices to remove
    indices = varargin{end};

    % number of input variables 
    num_var = numel(varargin) - 1;

    % remove variables
    for var_index = 1:num_var
        var_current = varargin{var_index};
        var_current(indices) = [];
        varargout{var_index} = var_current;
    end

end