function fprintf_c(varargin)
% This function runs fprintf if the last element is true.
%
% INPUTS:
% arguments passes in the desired fprintf call, with an extra boolean at
% the end denoting the print flag.
% example: fprintf_c('a: %d\n', a, true);
%
% OUTPUTS:
% None.
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % extract print flag
    print_flag = varargin{end};
    % display statement if flag is true
    if print_flag
        fprintf(varargin{1:end-1});
    end
end