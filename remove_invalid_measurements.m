function [x_valid, valid_indices] = remove_invalid_measurements(x, min_threshold, max_threshold)
    valid_indices = find(x >= min_threshold & x <= max_threshold); 
    x_valid = x(valid_indices);    
end