function save_workspace_to_file(write_directory, script_name_full, allvars)
    fprintf('saving workspace to file\n');
    workspace_save_directory = fullfile(write_directory, 'workspace');
    mkdir_c(workspace_save_directory);
    
    % if the script name is empty (when running from terminal), assign a dummy
    % name
    if isempty(script_name_full)
        script_name = 'workspace';
    else
        % this is the name of the current script
        [~, script_name, ~] = fileparts(script_name_full);
        fprintf('script_name: %s\n', script_name);        
    end
    
    allvars = evalin('base','whos');
    % Identify the variables that ARE NOT graphics handles. This uses a regular
    % expression on the class of each variable to check if it's a graphics object
    tosave = cellfun(@isempty, regexp({allvars.class}, '^matlab\.(ui|graphics)\.'));
    
    % Pass these variable names to save
    % save('output.mat', allvars(tosave).name)
    % fprintf('variables to be saved: %s\n', allvars(tosave).name);
    save(fullfile(workspace_save_directory, [script_name '.mat']), 'allvars', '-v7.3');
end