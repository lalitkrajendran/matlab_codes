function cell_array = create_empty_cell_array(size1, size2, size3)
% Function to create an empty cell array of specified size.
%
% INPUTS:
% size1, size2, size3: dimensions of the cell array
%
% OUTPUTS:
% cell_array: empty cell array
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)
%
% DATE:
% 2020/06/09

    if nargin < 2
        size2 = 1;
        size3 = 1;
    elseif nargin < 3
        size3 = 1;
    end

    cell_array = cell(size1, size2, size3);
    
    for size1_ind = 1:size1
        for size2_ind = 1:size2
            for size3_ind = 1:size3
                cell_array{size1_ind, size2_ind, size3_ind} = [];
            end                
        end            
    end

end