function C = convert_matrix_to_cell_array(M)
% Function to convert an input matrix to cell array
%
% INPUTS:
% M: matrix
%
% OUTPUTS:
% C: cell array
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % number of variables
    N = size(M, 2);

    % number of entries for each variables
    K = size(M, 1);

    % create matrix to hold elements
    C = cell(1, N);

    % copy elements
    for n = 1:N
        for k = 1:K
            C{n}(k) = M(k, n);
        end
    end
    
end