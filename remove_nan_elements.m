function varargout = remove_nan_elements(varargin)
% Function to remove nan elements from variables. If multiple
% variables are passed, then indices where any one of the 
% variables are NaN will be removed.
%
% INPUTS:
% varargin: variables where nan elements are to be removed
%
% OUTPUTS:
% varargout: variables with nan elements removed
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)
    
    % identify entries containing at least one nan elements
    indices = identify_nan_elements(varargin{:});

    % remove corresponding entries from all variables
    [varargout{1:nargout}] = remove_indices_from_array(varargin{:}, indices);

end