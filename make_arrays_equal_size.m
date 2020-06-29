function [arr1_new, arr2_new] = make_arrays_equal_size(arr1, arr2, fill_val)
% Function to make two input arrays the same size by padding the 
% smaller array with the value specified in fill_val.
%
% INPUTS:
% arr1, arr2: input arrays
% fill_val: value to pad
%
% OUTPUTS:
% arr1_new, arr2_new: arrays of equal size
%
% AUTHORS:
% Lalit Rajendran (lrajendr@purdue.edu)
%
% DATE:
% 2020/06/02

    % calculate size of the arrays
    [r1, c1] = size(arr1);
    [r2, c2] = size(arr2);

    % calculate max dimensions
    rmax = max(r1, r2);
    cmax = max(c1, c2);
    
    % pad arrays
    arr1_new = padarray(arr1, [rmax - r1, cmax - c1], fill_val, 'post');
    arr2_new = padarray(arr2, [rmax - r2, cmax - c2], fill_val, 'post');

    % N1 = numel(arr1);
    % N2 = numel(arr2);

    % % if arr1 is longer
    % if N1 > N2
    %     arr1_new = arr1;
    %     arr2_new = padarray(arr2, [0, N1 - N2], fill_val, 'post');
    % % if arr2 is longer
    % elseif N2 > N1
    %     arr1_new = padarray(arr1, [0, N2 - N1], fill_val, 'post');
    %     arr2_new = arr2;
    % % if both are of equal length
    % else
    %     arr1_new = arr1;
    %     arr2_new = arr2;
    % end
end