function [bias_error, random_error, total_error, rms_error] = calculate_error_statistics(err, dim)
% This function computes the bias, random and rms errors associated with
% the input data set. The errors are defined as follows:
% Bias/Systematic Error: E[x] - x_ref
% Random error: sqrt(E[{x - E[x]}^2])
% RMS error: sqrt(E[{x-x_ref}^2]) = sqrt(Bias^2 + Random^2) 

% INPUTS: err - errors

    % bias error
    bias_error = mean(err, dim, 'omitnan');    

    % random error
    random_error = std(err, [], dim, 'omitnan');    
    
    % total error
    total_error = sqrt(bias_error.^2 + random_error.^2); 
    
    % rms error
    rms_error = nanrms(err);
  
end