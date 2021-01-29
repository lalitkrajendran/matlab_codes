function level = calculate_level(f, f_min, f_max, num_levels)
% Function to calculate a discrete level corresponding to the value
% of a variable in a specified range
%
% INPUTS:
% f: variable of interest
% f_min, f_max: min and max values of the variable
% num_levels: number of discretization levels
% 
% OUTPUTS:
% level: discrete level for the variable's value
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % calculate discrete level
    level = (f - f_min) / (f_max - f_min) * num_levels;
    % ensure that the level is an integer
    level = round(level);
    % ensure that the level is in the range of allowed values
    level = cap_variable(level, 1, num_levels);

end