function valid_index = check_valid_index(num_rows, num_cols, r, c)
% Function to check if a given index is within the matrix dimensions
%
% INPUTS:
% num_rows, num_cols: size of the matrix
% r, c: row and column index
%
% OUTPUTS:
% valid_index: true/false result of the check.
%
% AUTHORS:
% Lalit Rajendran (lrajendr@purdue.edu)

    if r>=1 && r<=num_rows && c>=1 && c<=num_cols
        valid_index = true;
    else
        valid_index = false;
    end
end