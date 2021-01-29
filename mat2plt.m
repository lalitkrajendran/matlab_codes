% Converts matlab arrays to tecplot readable files
% [values] is array of data either row or column ordered
% [names] is a cell array of string names for each variable {'','',...}
    % First Two are X and Y variable Names. All others are names of zones. 
% [filename] is the name for the file without a .plt appended
% [casename] is the name for the zone in the file
% [type] can be set to 'xy' for x-y lines or '2d' for contour
% [njump] for 2D contour plots, number of points until next row

% Created 2/28/13 by Devon
% Modded 1/1/14 by MK
% Fixed bug in 2d plots 7/23/14. MK
% Added support for multiple variables 7/5/14 MK

% For 2d plots the values should be: mat2plt({[X1] [Y1] [X2] [Y2]..etc...}, {'XVariable','YVariable', 'Zone1', 'Zone2',...etc...},'FileName ','Test1','xy')
% For 2d_SinleZone plots the values should be:  mat2plt({[X] [Y1] [Y2] ..etc...}, {'XVariable','Y1Variable', 'Y2Variable',...etc...},'FileName ','Test1','xy')


function [] = mat2plt(values,names,filename,casename,type)
%% Determine Orientation of Data
if strcmp(type, 'xy')
    N = length(values);

    if mod(N,2) ~= 0
        fprintf ('Error: The number of X and Y vectors do not match');
        return
    end
    [nr,nc] = size(values);
    if nr>nc
        values = values'; % Make it a col vector
    end
elseif strcmp(type, '2d')
    [nr, nc] = size(values{3});
    if nr ~= length(values{1})
        if nc ~= length(values{2})
            frintf ('Error: Output vector does not match input vectors\n')
        else
            values{3} = values{3}';
        end
    end
    nv = length(values);
elseif strcmp(type, 'xy_SingleZone')
    N = length(values);
else
    fprintf('Error: Unknown Pplot type \n')
    return
end
        
    

%% Check for errors
% if nv ~= length(names)
%     fprintf('Error: Number of Variables Does Not Match\n');
%     return
% end

if strcmp(type, 'xy')
    if length(names) ~= N/2 + 2
        fprintf('Error: Too many variables \n')
        return
    end
elseif strcmp(type, '2d')
    if length(names) ~= 3
        fprintf('Error: Too many variables \n')
        return
    end
elseif strcmp(type, 'xy_SingleZone')
    if length(names) ~= N
        fprintf('Error: Too many variables \n')
        return
    end
end

%% Open File and Print Header
fid = fopen([filename '.plt'],'w');
fprintf(fid,['TITLE="' filename '"\n']);


%% Print Data and Close File
if strcmp(type, 'xy')
    fprintf(fid,['VARIABLES= "', names{1}, '", "', names{2},'"']);
    for j = 1:N/2
        fprintf(fid,['\nZONE T="' names{j+2} '", I= ' num2str(length(values{2*j-1})) ', F=POINT \n']);
        for i = 1:(length(values{2*j-1}))
            fprintf (fid, '%14.6e  %14.6e \n',[values{2*j-1}(i) values{2*j}(i)]);
        end
        fprintf(fid,'\n');
    end
elseif  strcmp(type,'2d')% 2d plots
    fprintf(fid,['VARIABLES= "', names{1}, '", "', names{2}, '", "', names{3},'"']);
    fprintf(fid,['\nZONE T="' casename '", I= ' num2str(length(values{1})) ', J= ' num2str(length(values{2})) ', F=POINT \n']);
    for j = 1:length(values{2})
        for i = 1:length (values{1})
            fprintf (fid, '%14.6e   %14.6e   %14.6e    \n', [values{1}(i), values{2}(j), values{3}(i,j)]);
        end
    end
elseif strcmp(type, 'xy_SingleZone')
    
    Variables = '';
    for i = 1:N
        if i > 1
            Variables = strcat(Variables, ', ');
        end
        Variables = strcat(Variables,'"',names{i},'"');
    end
    
    fprintf(fid, ['VARIABLES= ', Variables]);
    fprintf(fid, ['\nZONE T= "' casename '", I= ' num2str(length(values{1}))  ', F=POINT \n']);

    for j = 1: length(values{1})
        for i = 2: N
            AA(1,i-1) = values{i}(j); 
        end
        fprintf ( fid,'%14.6e  %14.6e',[values{1}(j) AA(1,:)]);
        fprintf ( fid, '\n');
    end
end

fclose all;
            
    
    
    
