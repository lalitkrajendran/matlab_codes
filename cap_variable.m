function x_new = cap_variable(x, minval, maxval)
% Function to cap the values of a variable to be withing
% specified limits, usually for plotting purposes
%
% INPUTS:
% x: variable whose values are to be capped
% minval: minimum allowable value
% maxval: maximum allowable value
%
% OUTPUTS:
% x_new: variable with capped values
%
% AUTHORS:
% Lalit Rajendran (lrajendr@purdue.edu)
%
% DATE:
% 2020-04-30 09:55:27

    x_new = x;

    x_new(x < minval) = minval;
    x_new(x > maxval) = maxval;
end