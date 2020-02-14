function im = bin2matrix(filename, file_format, height, width)
% This function reads the contents of a binary file given by
% the filename containing the data in a specified format
% and returns it as a reshaped matrix

% INPUTS:
% filename - full name (including path) of the binary file
% file_format - format of the data in the file ('single', 'uint32' etc.)
% height, width - number of rows and columns
	
	% open file for reading
    fileID = fopen(filename,'r');
	% read file contents   
    im = fread(fileID,file_format);
    % close file
	fclose(fileID);
	
	% reshape file into the correct size
    im = reshape(im,height,width);
	% permute the file as C saves arrays in row major order (horizontal)
	% but matlab reads in column major order (vertical)
    im = permute(im,[2 1]);
end