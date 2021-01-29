function [x_valid, valid_indices] = nan_invalid_measurements_percentile(x, min_percentile_threshold, max_percentile_threshold)
% Function to set measurements outside a range to NaN
%
% INPUTS:
% x: array with measurements
% min_percentile_threshold, max_percentile_threshold: min and max percentiles of the valid range of values
%
% OUTPUTS:
% x_valid: array with invalid measurements set to NaN
% valid_indices: indices with valid measurements
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)    

    % evaluate min and max thresholds
    min_threshold = prctile(x, min_percentile_threshold);
    max_threshold = prctile(x, max_percentile_threshold);

    % set measurements outside this range to nan
    [x_valid, valid_indices] = nan_invalid_measurements(x, min_threshold, max_threshold);
end