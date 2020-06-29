function [x_valid, valid_indices] = nan_invalid_measurements(x, min_threshold, max_threshold)
    x_valid = nans(1, numel(x));
    valid_indices = find(x >= min_threshold & x <= max_threshold);    
    x_valid(valid_indices) = x(valid_indices);
end