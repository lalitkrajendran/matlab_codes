function [subplots, num_subplots] = extract_subplots(fig)
% Function to extract subplots from a figure, ignoring legend and other handles.
%
% INPUTS:
% fig: figure handle.
%
% OUTPUTS:
% subplots: handles to subplot axes
% num_subplots: number of subplot handles
%
% AUTHOR:
% Lalit Rajendran (lrajendr@purdue.edu)

    % get children
    children = fig.Children;
    num_children = numel(children);
    children_new = children;

    % loop through children and remove those that are not axes
    for child_index = 1:num_children
        if ~strcmpi(children(child_index).Type, 'axes')
            children_new(child_index) = [];
        end
    end

    % assign subplots to new variable
    subplots = children_new;
    % calculate number of subplots
    num_subplots = numel(subplots);
end