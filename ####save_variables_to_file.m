function save_variables_to_file(varargin)
% This function saves an arbitrary number of variables to the specified
% filename. It is useful in parfor loops where the save command is not
% allowed inside the loop.
%
% INPUT:
% varargin: variable number of inputs. The only requirements are:
%           1) the first argument should be the filename
%           2) there should atleast be one variable to save
%
% OUTPUTS:
% None.
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)
    
    % exit function if number of inputs is less than 2
    if numel(varargin) < 2
        fprintf('Function needs atleast 2 inputs. Exiting.\n');
        return;        
    end
    
    % exit function if the first input is not a string
    if ~ischar(varargin{1})
        fprintf('Filename needs to be string. Exiting\n');
        return;
    end
    
    % extract filename
    filename = varargin{1};
    % create structure to hold the variables
    results_struct = struct;
    % loop through the input and assign the variables to be fields of the
    % results structures
    for var_index = 2:numel(varargin)
        % extract variable name as called in the parent function
        var_name = inputname(var_index);
        % create field and store variable data
        results_struct.(var_name) = varargin{var_index};
    end
    % save results to file
    save(filename, '-struct', 'results_struct');
end