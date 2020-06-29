function shut_down_parpool()
% Function to shut down an existing parallel pool
%
% INPUTS: None
%
% OUTPUTS: None
%
% AUTHORS: Lalit Rajendran (lrajendr@purdue.edu)
%
% DATE: 05/01/2020

    % get current pool object
    poolobj = gcp('nocreate');
    
    if isempty(poolobj)
        % inform user that no parallel pool was found
        fprintf('no parallel pool found\n');
    else
        % shut down parallel pool
        delete(poolobj);
    end
end
