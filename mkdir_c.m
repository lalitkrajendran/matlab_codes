function mkdir_c(directory)
% Function to create a new directory if the directory
% does not exist. This checks if the directory already exists, to avoid
% triggering the MATLAB warning.
%
% INPUTS:
% directory: path to the directory
%
% OUTPUTS:
% NONE
%
% AUTHORS:
% Lalit Rajendran (lrajendr@purdue.edu)

    if ~exist(directory, 'dir')
        mkdir(directory);
    end
end