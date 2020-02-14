function x_valid = nan_invalid_measurements(x, min_threshold, max_threshold)
    x_valid = nans(1, numel(x));
    indices = find(abs(x) >= min_threshold & abs(x) <= max_threshold);    
    x_valid(indices) = x(indices);
end