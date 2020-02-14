function h5tonrrd(read_filename, write_filename)
% This program reads in a set of files in H5 or HDF5 format and saves them
% in NRRD format.

% INPUT:
% read_filename: name of .h5 file (including path)
% write_filename: name of .nrrd file (including path)

  % Read variables from file
  rho = h5read(read_filename, '/rho');
  x = h5read(read_filename, '/x');
  y = h5read(read_filename, '/y');
  z = h5read(read_filename, '/z');
  u = h5read(read_filename, '/u');
  v = h5read(read_filename, '/v');
  w = h5read(read_filename, '/w');
    
  % Permute it to alter permutation in nrrdWriter
  rho = permute(rho, [2 1 3]);
 
  % specify file name for the nrrd file as well as the tiff file where the
  % rendered schlieren image will be saved
  temp_name = files(i).name;
  nrrd_name = [temp_name(1:numel(temp_name)-2) 'nrrd'];
  tiff_name = [temp_name(1:numel(temp_name)-2) 'tiff'];

  % save file as nrrd
  x_diff = diff(x);
  y_diff = diff(y);
  z_diff = diff(z);
  
  del_x = x_diff(1);
  del_y = mean(y_diff);
  del_z = z_diff(1);
  origin_x = min(x);
  origin_y = min(y);
  origin_z = min(z);
  
  nrrdWriter(write_filename,single(rho),[del_x del_y del_z],[origin_x,origin_y,origin_z],'raw');
end

