function script_name = extract_script_name(script_name_full)
    % if the script name is empty (when running from terminal), assign a dummy
    % name
    if isempty(script_name_full)
        script_name = 'workspace';
    else
        % this is the name of the current script
        [~, script_name, ~] = fileparts(script_name_full);
        fprintf('script_name: %s\n', script_name);
    end
end