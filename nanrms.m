function y = nanrms(x, dim)
% returns the rms value of an error without accounting for nans
%
% INPUT:
% x: array for which the RMS is to be calculated
% dim: dimension along which the rms is to be calculated (default is the
% last dimension)
%
% OUTPUT:
% y: array of rms values
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)
    
    % if dimension is not specified, then assign it to be the last
    % dimension 
    if nargin < 2
        dim = numel(size(x));
    end
    % calculate rms without nans
    y = sqrt(mean(x.^2, dim, 'omitnan'));
end