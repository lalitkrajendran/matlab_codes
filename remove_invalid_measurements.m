function x_valid = remove_invalid_measurements(x, min_threshold, max_threshold)
    x_valid = x(abs(x) >= min_threshold & abs(x) <= max_threshold);    
end