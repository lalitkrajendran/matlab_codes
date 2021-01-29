function M = convert_cell_array_to_matrix(C)
% Function to convert a cell array to a matrix
%
% INPUTS:
% C: cell array
%
% OUTPUTS:
% M: matrix
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % number of variables
    N = numel(C);

    % number of entries for variables
    K = numel(C{1});

    % create matrix to hold elements
    M = ones(K, N);

    % copy elements
    for n = 1:N
        for k = 1:K
            M(k, n) = C{n}(k);
        end
    end

end