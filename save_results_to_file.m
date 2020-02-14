function save_results_to_file(filename, save_struct)
% This function saves the contents of a structure to a file.
% It is useful in parfor loops where the save command is not allowed inside
% the loop. To use this function, package all variables to be saved into a
% structure and pass it to the function. This function will then extract
% all variables from the struct and save them to the file specified by
% filename.
%
% INPUT:
% filename: name of file
% save_struct: structure containing results to be saved
%
% OUTPUTS:
% None.
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % save results to file
    save(filename, '-struct', 'save_struct');

end